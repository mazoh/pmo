class CreateEspeciales < ActiveRecord::Migration
  def self.up
    create_table :especiales do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :especiales
  end
end
