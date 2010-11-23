class CreateFormaciones < ActiveRecord::Migration
  def self.up
    create_table :formaciones do |t|
      t.string :tipo_estudio
      t.integer :titulo_id
      t.string :area_conocimiento
      t.integer :universidad_id
      t.integer :ciudad_id
      t.string :estado
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :formaciones
  end
end
