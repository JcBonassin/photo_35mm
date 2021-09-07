class CreateLabellings < ActiveRecord::Migration[6.1]
  def change
    create_table :labellings do |t|
      t.belongs_to :label, null: false, foreign_key: true
      t.belongs_to :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
