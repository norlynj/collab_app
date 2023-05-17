class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :tag
      t.string :string
      t.timestamps
    end
  end
end
