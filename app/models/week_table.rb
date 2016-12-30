class WeekTable < ApplicationRecord
  has_many :events , inverse_of: :weektable
  accepts_nested_attributes_for :events
end
