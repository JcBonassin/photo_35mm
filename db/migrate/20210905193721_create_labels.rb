class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.string :tag
      t.integer :photo_id

      t.timestamps
    end
  end
end
