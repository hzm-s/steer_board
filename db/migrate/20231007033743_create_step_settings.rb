class CreateStepSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :step_settings, id: :uuid do |t|
      t.references :step, null: false, type: :uuid, foreign_key: true
      t.integer :wip_limit
      t.boolean :has_pre_queue, null: false
      t.boolean :has_post_queue, null: false
      t.boolean :allow_idea, null: false
      t.boolean :allow_add, null: false

      t.timestamps
    end
  end
end
