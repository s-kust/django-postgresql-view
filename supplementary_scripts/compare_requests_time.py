import argparse
import asyncio
import io
import random
from pathlib import Path
from typing import List

import aiohttp
import pandas as pd
import psycopg2
from aiohttp import ClientSession

LOG_FILE_PATH = Path(__file__).parent.parent / "app/logs_all_here.log"
DB_CONNECTION_DATA = (
    "dbname='postgres' user='postgres' host='localhost' password='postgres'"
)
URL_NATIVE_STUB = "http://localhost:8000/rooms_native/"
URL_MAT_VIEW_STUB = "http://localhost:8000/rooms_mat_view/"
URL_SIGNALS_STUB = "http://localhost:8000/rooms_v2/"
URL_TRIGGERS_STUB = "http://localhost:8000/rooms_v3/"


def _obtain_rooms_ids() -> List:
    conn = psycopg2.connect(DB_CONNECTION_DATA)
    db_cursor = conn.cursor()
    query_str = "SELECT id FROM public.rooms_room"
    db_cursor.execute(query_str)
    ids_obtained = db_cursor.fetchall()
    conn.close()
    room_ids = []
    for elem in ids_obtained:
        room_ids.append(elem[0])
    print("Obtained list of all room IDs - OK...")
    return room_ids


async def _make_get_request_to_url(session: ClientSession, url: str) -> None:
    async with session.get(url):
        pass


async def _make_requests_to_all_rooms(
    rooms_ids: List, iterations_count: int
) -> None:
    async with aiohttp.ClientSession() as session:
        for i in range(iterations_count):
            room_id = random.choice(rooms_ids)
            all_urls = [
                URL_NATIVE_STUB + str(room_id),
                URL_MAT_VIEW_STUB + str(room_id),
                URL_SIGNALS_STUB + str(room_id),
                URL_TRIGGERS_STUB + str(room_id),
            ]
            request_tasks = [
                _make_get_request_to_url(session, url) for url in all_urls
            ]
            await asyncio.gather(*request_tasks)
            print("Request iteration", i + 1, "of", iterations_count)


def _log_lines_stage_1_determine_type() -> List:

    with open(LOG_FILE_PATH) as file:
        lines = file.read().splitlines()

    lines_processed = []
    for line in lines:
        _, _, end = line.partition("/rooms_")
        if not end:
            continue
        if end.startswith("mat_view/"):
            line = line + "; VIEW"
            lines_processed.append(line)
            continue
        if end.startswith("native/"):
            line = line + "; NATIVE_ROOM"
            lines_processed.append(line)
            continue
        if end.startswith("v2/"):
            line = line + "; SIGNALS"
            lines_processed.append(line)
            continue
        if end.startswith("v3/"):
            line = line + "; TRIGGERS"
            lines_processed.append(line)
            continue
        line = line + "; OTHER"
        lines_processed.append(line)
    return lines_processed


def _log_lines_stage_2_get_avg_time(log_lines: List) -> None:
    df = pd.read_csv(
        io.StringIO("\n".join(log_lines)),
        delimiter=";",
        delim_whitespace=False,
        header=None,
    )
    df.columns = ["MsgType", "Path", "ExecutionTime", "Type"]
    print("Number of rows (log records) - ", df.shape[0])
    print()
    print("Mean execution time by request type:")
    print(df.groupby("Type")["ExecutionTime"].mean())


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--count",
        type=int,
        help="how many rooms data to request, default 20",
        nargs="?",
        default=20,
        const=20,
    )
    args = parser.parse_args()
    room_ids = _obtain_rooms_ids()
    print("Start making requests to log time...")
    asyncio.run(_make_requests_to_all_rooms(room_ids, args.count))
    log_lines_with_types = _log_lines_stage_1_determine_type()
    _log_lines_stage_2_get_avg_time(log_lines_with_types)
