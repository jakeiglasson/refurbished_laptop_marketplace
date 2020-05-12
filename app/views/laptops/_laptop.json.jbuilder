json.extract! laptop, :id, :user_id, :brand_id, :grade, :cpu_id, :ram_id, :hard_drive_id, :model, :price, :sold_status, :created_at, :updated_at
json.url laptop_url(laptop, format: :json)
