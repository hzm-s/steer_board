class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses, id: :uuid do |t|
      t.references :item, null: false, type: :uuid, foreign_key: true, index: { unique: true }
      t.references :step, null: false, type: :uuid, foreign_key: true
      t.string :state_kind, null: false

      t.timestamps
    end
  end
end
