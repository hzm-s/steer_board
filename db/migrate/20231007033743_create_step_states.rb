class CreateStepStates < ActiveRecord::Migration[7.0]
  def change
    create_table :step_states do |t|
      t.references :step, null: false, type: :uuid, foreign_key: true
      t.integer :kind, null: false

      t.timestamps

      t.index [:step_id, :kind], unique: true
    end
  end
end
