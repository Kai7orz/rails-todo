class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_content

      t.timestamps
    end
  end
end
