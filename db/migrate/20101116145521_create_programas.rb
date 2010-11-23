class CreateProgramas < ActiveRecord::Migration
  def self.up
    create_table :programas do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :programas
  end
end
