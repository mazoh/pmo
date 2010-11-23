class CreateLineas < ActiveRecord::Migration
  def self.up
    create_table :lineas do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lineas
  end
end
