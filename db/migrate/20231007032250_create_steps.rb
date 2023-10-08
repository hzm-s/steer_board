class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps, id: :uuid do |t|
      t.references :work_flow, null: false, type: :uuid, foreign_key: true
      t.integer :position, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps

      t.index [:work_flow_id, :position], unique: true
    end
  end
end
