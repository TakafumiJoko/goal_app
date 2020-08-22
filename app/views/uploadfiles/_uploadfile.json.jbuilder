json.extract! uploadfile, :id, :name, :data, :created_at, :updated_at
json.url uploadfile_url(uploadfile, format: :json)
