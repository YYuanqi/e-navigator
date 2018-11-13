class Interview < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :time, presence: true
  validates :status, presence: true
  enum status: {hold: 0, approved: 1, rejected: 2 }
end
