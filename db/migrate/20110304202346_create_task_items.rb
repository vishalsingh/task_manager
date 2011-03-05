class CreateTaskItems < ActiveRecord::Migration
  def self.up
    create_table :task_items do |t|
      t.string :title
      t.text :summary
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :priority
      t.integer :total_hours_of_work

      t.timestamps
    end
  end

  def self.down
    drop_table :task_items
  end
end
