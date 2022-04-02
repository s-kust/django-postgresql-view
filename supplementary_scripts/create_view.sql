CREATE materialized VIEW rooms_related_objects AS WITH room_id_door_decoration AS (
  SELECT 
    room.id id, 
    jsonb_build_object(
      'id', door.id, 'name', door.name, 'width', 
      door.width, 'length', door.length, 
      'height', door.height, 'type', door.type
    ) door, 
    jsonb_build_object(
      'id', 
      decoration.id, 
      'name', 
      decoration.name, 
      'souvenirs', 
      jsonb_agg(souvenir)
    ) decoration 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_door door ON room.door_id = door.id 
    LEFT JOIN rooms_decoration decoration ON room.decoration_id = decoration.id 
    LEFT JOIN rooms_decoration_souvenirs ds ON decoration.id = ds.decoration_id 
    LEFT JOIN rooms_souvenir souvenir ON ds.souvenir_id = souvenir.id 
  GROUP BY 
    room.id, 
    door.id, 
    decoration.id
), 
windows_in_room_by_id AS (
  WITH room_window_fittings AS (
    SELECT 
      room_id, 
      json_build_object(
        'id', 
        win.id, 
        'name', 
        win.name, 
        'width', 
        win.width, 
        'length', 
        win.length, 
        'height', 
        win.height, 
        'type', 
        win.type, 
        'fittings', 
        jsonb_agg(wf)
      ) window_in_room 
    FROM 
      rooms_window win 
      LEFT JOIN rooms_windowfittings_windows rwfw ON rwfw.window_id = win.id 
      LEFT JOIN rooms_windowfittings wf ON wf.id = rwfw.windowfittings_id 
    GROUP BY 
      room_id, 
      win.id
  ) 
  SELECT 
    room_window_fittings.room_id AS id, 
    jsonb_agg(
      room_window_fittings.window_in_room
    ) windows 
  FROM 
    room_window_fittings 
  GROUP BY 
    id
), 
parameters_and_beds_in_room_by_id AS (
  SELECT 
    room.id id, 
    room.name name, 
    room.width width, 
    room.length length, 
    room.height height, 
    room.type type, 
    jsonb_agg(bed) beds 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_bed_rooms bed_i ON room.id = bed_i.room_id 
    LEFT JOIN rooms_bed bed ON bed.id = bed_i.bed_id 
  GROUP BY 
    room.id
), 
chairs_in_room_by_id AS (
  SELECT 
    room.id id, 
    jsonb_agg(chair) chairs 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_chair_rooms chair_i ON room.id = chair_i.room_id 
    LEFT JOIN rooms_chair chair ON chair.id = chair_i.chair_id 
  GROUP BY 
    room.id
), 
tables_in_room_by_id AS (
  SELECT 
    room.id id, 
    jsonb_agg(table_f) tables 
  FROM 
    rooms_room room 
    LEFT JOIN rooms_table_rooms table_i ON room.id = table_i.room_id 
    LEFT JOIN rooms_table table_f ON table_f.id = table_i.table_id 
  GROUP BY 
    room.id
) 
SELECT 
  COALESCE(
    room_id_door_decoration.id, windows_in_room_by_id.id
  ) AS id, 
  room_id_door_decoration.door, 
  room_id_door_decoration.decoration, 
  windows_in_room_by_id.windows, 
  parameters_and_beds_in_room_by_id.name, 
  parameters_and_beds_in_room_by_id.width, 
  parameters_and_beds_in_room_by_id.length, 
  parameters_and_beds_in_room_by_id.height, 
  parameters_and_beds_in_room_by_id.type, 
  parameters_and_beds_in_room_by_id.beds, 
  chairs_in_room_by_id.chairs, 
  tables_in_room_by_id.tables 
FROM 
  room_id_door_decoration FULL 
  OUTER JOIN windows_in_room_by_id ON room_id_door_decoration.id = windows_in_room_by_id.id FULL 
  OUTER JOIN parameters_and_beds_in_room_by_id ON windows_in_room_by_id.id = parameters_and_beds_in_room_by_id.id FULL 
  OUTER JOIN chairs_in_room_by_id ON parameters_and_beds_in_room_by_id.id = chairs_in_room_by_id.id FULL 
  OUTER JOIN tables_in_room_by_id ON chairs_in_room_by_id.id = tables_in_room_by_id.id WITH DATA;
CREATE UNIQUE INDEX ON rooms_related_objects (id);
REFRESH MATERIALIZED VIEW CONCURRENTLY rooms_related_objects;