class CreateAprendices < ActiveRecord::Migration
  def self.up
    create_table :aprendices do |t|
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :nivel
      t.string :etapa
      t.string :tipo_doc
      t.string :num_doc
      t.string :nombre
      t.string :apellido_uno
      t.string :apellido_dos
      t.boolean :genero
      t.string :email
      t.string :telefono
      t.string :celular
      t.string :estado
      t.integer :especial_id
      t.string :tipo_respuesta
      t.integer :ficha

      t.timestamps
    end
  end

  def self.down
    drop_table :aprendices
  end
end
