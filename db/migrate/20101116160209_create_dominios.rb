class CreateDominios < ActiveRecord::Migration
  def self.up
    create_table :dominios do |t|
      t.integer :idioma_id
      t.string :lee
      t.string :escribe
      t.string :habla
      t.string :traduce
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dominios
  end
end
