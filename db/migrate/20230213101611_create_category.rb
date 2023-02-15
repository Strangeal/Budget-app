class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :author, references: :authors, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.string :icon, default: "https://cdn-icons-png.flaticon.com/512/4835/4835459.png"

      t.timestamps
    end
  end
end
