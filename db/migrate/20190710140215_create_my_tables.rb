class CreateMyTables < ActiveRecord::Migration[5.2]
  def change
    create_table :my_tables do |t|
      t.string :name
      t.references :my_project, foreign_key: true

      t.timestamps
    end
  end
end
