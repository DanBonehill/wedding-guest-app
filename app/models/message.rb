class Message < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :unique_code, length: { is: 6 }, allow_blank: true
  validates :read, presence: true
end
