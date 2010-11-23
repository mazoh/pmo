class CreateAcademicos < ActiveRecord::Migration
  def self.up
    create_table :academicos do |t|
      t.string :titulo
      t.string :centro
      t.integer :ciudad_id
      t.string :estado
      t.integer :practica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :academicos
  end
end
