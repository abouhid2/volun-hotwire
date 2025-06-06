class Event < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :entity
  
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
