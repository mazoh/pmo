class CreateAlternativas < ActiveRecord::Migration
  def self.up
    create_table :alternativas do |t|
      t.string :tema
      t.string :desicion
      t.string :cual
      t.integer :practica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :alternativas
  end
end
