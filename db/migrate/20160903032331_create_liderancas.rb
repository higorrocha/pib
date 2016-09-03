class CreateLiderancas < ActiveRecord::Migration
  def change
    create_table :liderancas do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
