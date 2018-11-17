class ChangeStatusToIntInInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :status, 'integer USING CAST(status AS integer)', null: false, default: 0
  end
end
