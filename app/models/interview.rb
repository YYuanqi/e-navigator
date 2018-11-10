class Interview < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :time, presence: true
  validates :status, presence: true
  enum gender: { 保留: 0, 承認: 1, 却下: 2 }
end
