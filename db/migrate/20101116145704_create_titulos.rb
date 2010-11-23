class CreateTitulos < ActiveRecord::Migration
  def self.up
    create_table :titulos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :titulos
  end
end
