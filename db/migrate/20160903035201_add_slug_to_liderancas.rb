class AddSlugToLiderancas < ActiveRecord::Migration
  def change
    add_column :liderancas, :slug, :string
    add_index :liderancas, :slug, unique: true
  end
end
