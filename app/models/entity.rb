class Entity < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  
  scope :active, -> { where(deleted_at: nil) }
  
  def soft_delete
    update(deleted_at: Time.current)
  end
  
  def active?
    deleted_at.nil?
  end
end 