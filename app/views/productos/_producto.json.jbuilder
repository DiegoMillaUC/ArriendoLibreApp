json.extract! producto, :id, :nombre, :imagen, :precio, :descripcion, :stock_actual, :stock_total, :disponible, :categoria, :created_at, :updated_at
json.url producto_url(producto, format: :json)
json.imagen url_for(producto.imagen)
