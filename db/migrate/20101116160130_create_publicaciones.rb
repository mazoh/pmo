class CreatePublicaciones < ActiveRecord::Migration
  def self.up
    create_table :publicaciones do |t|
      t.string :autor
      t.string :titulo_publicacion
      t.string :tipo_publicacion
      t.date :ano
      t.string :referencia
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :publicaciones
  end
end
