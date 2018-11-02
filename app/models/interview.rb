class Interview < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id, presence: true
  validates :time, presence: true
  validates :status, presence: true
end
