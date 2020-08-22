class CreateUploadfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploadfiles do |t|
      t.string :name
      t.binary :data

      t.timestamps
    end
  end
end
