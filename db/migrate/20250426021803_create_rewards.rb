class CreateRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :points_required
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
