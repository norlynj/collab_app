class CreateUpdateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :update_logs do |t|
      t.text :note
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
