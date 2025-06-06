class Entity < ApplicationRecord
  acts_as_paranoid
  
  has_many :events, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
