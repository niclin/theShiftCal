class Slack < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :events, through: :shifts
end
