class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.timestamps

      t.string :name
      t.timestamps null: false
      t.text :introduction
    end
  end
end
