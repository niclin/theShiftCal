class Shift < ApplicationRecord
  belongs_to :event
  belongs_to :slack
end
