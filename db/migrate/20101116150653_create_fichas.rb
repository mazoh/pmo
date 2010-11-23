class CreateFichas < ActiveRecord::Migration
  def self.up
    create_table :fichas do |t|
      t.string :numero
      t.integer :programa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fichas
  end
end
