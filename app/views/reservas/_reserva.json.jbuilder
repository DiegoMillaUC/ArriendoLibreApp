json.extract! reserva, :id, :descripcion, :fecha_inicio, :fecha_termino, :aceptado, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
