import requests
import random
import psycopg2

if __name__ == '__main__':
    print("Start make_requests_to_log_time...")
    conn = psycopg2.connect(
        "dbname='postgres' user='postgres' host='localhost' password='postgres'")
    db_cursor = conn.cursor()
    s = "SELECT id FROM public.rooms_room"
    db_cursor.execute(s)
    ids_obtained = db_cursor.fetchall()
    conn.close()
    room_ids = []
    for elem in ids_obtained:
        room_ids.append(elem[0])
    print("Obtained list of all room IDs - OK...")
    requests_count = 20
    for i in range(requests_count):
        room_id_for_rooms = random.choice(room_ids)
        _ = requests.get('http://localhost:8000/rooms/' +
                         str(room_id_for_rooms))
        room_id_for_rooms2 = random.choice(room_ids)
        _ = requests.get('http://localhost:8000/rooms_mat_view/' +
                         str(room_id_for_rooms2))
        print("Request pair", i+1, "of", requests_count)
