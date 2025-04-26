class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :points
      t.datetime :due_date
      t.boolean :completed
      t.string :repeat_days
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
