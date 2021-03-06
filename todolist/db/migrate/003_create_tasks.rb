class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.belongs_to :person
      t.string :name
      t.boolean :finished
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
