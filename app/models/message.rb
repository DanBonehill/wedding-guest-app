class Message < ApplicationRecord
  before_validation :set_defaults, on: :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :unique_code, length: { is: 6 }, allow_blank: true

  scope :unread, -> { where(read: false) }

  private

  def set_defaults
    self.read = false
  end
end
