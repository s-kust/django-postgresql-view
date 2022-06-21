import argparse
import io
import random
from pathlib import Path
from typing import List

import pandas as pd
import psycopg2
import requests

LOG_FILE_PATH = Path(__file__).parent.parent / "app/logs_all_here.log"


def _obtain_rooms_ids() -> List:
    db_connection_data = "dbname='postgres' user='postgres' host='localhost' password='postgres'"
    conn = psycopg2.connect(db_connection_data)
    db_cursor = conn.cursor()
    s = "SELECT id FROM public.rooms_room"
    db_cursor.execute(s)
    ids_obtained = db_cursor.fetchall()
    conn.close()
    room_ids = []
    for elem in ids_obtained:
        room_ids.append(elem[0])
    print("Obtained list of all room IDs - OK...")
    return room_ids


def _make_requests_to_all_rooms(
    rooms_ids: List, iterations_count: int
) -> None:
    for i in range(iterations_count):
        room_id = random.choice(rooms_ids)
        requests.get("http://localhost:8000/rooms_native/" + str(room_id))
        requests.get("http://localhost:8000/rooms_mat_view/" + str(room_id))
        requests.get("http://localhost:8000/rooms_v2/" + str(room_id))
        requests.get("http://localhost:8000/rooms_v3/" + str(room_id))
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
    _make_requests_to_all_rooms(room_ids, args.count)
    log_lines_with_types = _log_lines_stage_1_determine_type()
    _log_lines_stage_2_get_avg_time(log_lines_with_types)
