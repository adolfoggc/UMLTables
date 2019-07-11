class CreateTuples < ActiveRecord::Migration[5.2]
  def change
    create_table :tuples do |t|
      t.string :name
      t.string :data
      t.references :my_table, foreign_key: true

      t.timestamps
    end
  end
end
