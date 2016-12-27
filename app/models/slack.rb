class Slack < ApplicationRecord
  has_many :shifts
  has_many :events, through: :shifts
end
