class CreateWeeklySummaries < ActiveRecord::Migration[8.0]
  def change
    create_table :weekly_summaries do |t|
      t.date :week_start_date
      t.integer :total_points
      t.boolean :reward_claimed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
