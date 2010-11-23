class CreatePrototipos < ActiveRecord::Migration
  def self.up
    create_table :prototipos do |t|
      t.string :depositario
      t.string :titulo_invencion
      t.string :tipo_patente
      t.integer :pais_id
      t.string :num_registro
      t.date :ano
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prototipos
  end
end
