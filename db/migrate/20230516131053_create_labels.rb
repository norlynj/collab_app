class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :tag
      t.string :string
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
