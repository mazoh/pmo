class CreateDocentes < ActiveRecord::Migration
  def self.up
    create_table :docentes do |t|
      t.date :fecha_diligencia
      t.string :nombres
      t.string :apellidos
      t.boolean :genero
      t.date :fecha_nacimiento
      t.integer :nacionalidad_id
      t.string :tipo_documento
      t.string :num_documento
      t.string :email
      t.integer :telefono_fijo
      t.integer :fax
      t.string :telefono_movil
      t.integer :area_id
      t.integer :cargo_id
      t.string :antiguedad
      t.string :dedicacion
      t.string :nombre_entidad
      t.string :tipo_vinculacion
      t.boolean :hoja_registrada
      t.boolean :requiere_apoyo
      t.boolean :adscrito_grupo
      t.string :nombre_grupo
      t.boolean :adscrito_comunidad
      t.string :nombre_comunidad
      t.boolean :sitio
      t.string :nombre_sitio
      t.string :sugerencias

      t.timestamps
    end
  end

  def self.down
    drop_table :docentes
  end
end
