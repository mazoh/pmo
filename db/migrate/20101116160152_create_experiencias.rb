class CreateExperiencias < ActiveRecord::Migration
  def self.up
    create_table :experiencias do |t|
      t.string :docencia
      t.string :institucion_empresa
      t.string :area
      t.string :periodo
      t.date :ano
      t.string :resultados
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :experiencias
  end
end
