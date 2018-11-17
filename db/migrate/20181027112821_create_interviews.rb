class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :time
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :interviews, [:user_id, :created_at]
  end
end
