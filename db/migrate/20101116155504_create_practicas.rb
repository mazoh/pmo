class CreatePracticas < ActiveRecord::Migration
  def self.up
    create_table :practicas do |t|
      t.date :fecha_dil
      t.boolean :grupo
      t.string :nom_grup
      t.boolean :comunidad
      t.string :nom_com
      t.boolean :sitio
      t.string :nom_sit
      t.boolean :realiza_pract
      t.string :donde_pract
      t.boolean :partcipar
      t.string :area_part
      t.integer :aprendiz_id

      t.timestamps
    end
  end

  def self.down
    drop_table :practicas
  end
end
