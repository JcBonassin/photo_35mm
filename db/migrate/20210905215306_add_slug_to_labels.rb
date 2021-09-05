class AddSlugToLabels < ActiveRecord::Migration[6.1]
  def change
    add_column :labels, :slug, :string
    add_index :labels, :slug, unique: true
  end
end
