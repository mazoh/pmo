class CreateInvestigaciones < ActiveRecord::Migration
  def self.up
    create_table :investigaciones do |t|
      t.string :tema
      t.string :tipo_formacion
      t.integer :universidad_id
      t.integer :ciudad_id
      t.date :ano
      t.integer :docente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :investigaciones
  end
end
