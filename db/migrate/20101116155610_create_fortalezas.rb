class CreateFortalezas < ActiveRecord::Migration
  def self.up
    create_table :fortalezas do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :practica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fortalezas
  end
end
