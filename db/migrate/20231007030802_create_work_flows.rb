class CreateWorkFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :work_flows, id: :uuid do |t|

      t.timestamps
    end
  end
end
