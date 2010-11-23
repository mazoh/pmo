class CreateNacionalidades < ActiveRecord::Migration
  def self.up
    create_table :nacionalidades do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :nacionalidades
  end
end
