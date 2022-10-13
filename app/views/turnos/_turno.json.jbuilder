json.extract! turno, :id, :nombre_completo, :comuna, :direccion_salida, :dia_semana, :hora_salida, :limite_personas, :direccion, :descripcion, :tipo, :created_at, :updated_at
json.url turno_url(turno, format: :json)
