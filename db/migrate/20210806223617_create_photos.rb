class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :body
      t.text :image_data

      t.timestamps
    end
  end
end
