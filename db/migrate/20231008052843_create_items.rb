class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :kind, null: false
      t.string :content, null: false
      t.text :note
      t.integer :size
      t.datetime :due

      t.timestamps
    end
  end
end
