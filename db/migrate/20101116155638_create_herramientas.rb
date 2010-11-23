class CreateHerramientas < ActiveRecord::Migration
  def self.up
    create_table :herramientas do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :practica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :herramientas
  end
end
