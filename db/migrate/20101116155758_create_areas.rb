class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :name
      t.integer :centro_id

      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end
