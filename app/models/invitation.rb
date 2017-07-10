class Invitation < ApplicationRecord
  before_validation :set_defaults, :set_unique_code, on: :create

  validates :rsvp, :inclusion => { :in => ["Awaiting RSVP" , "Attending", "Not Attending"] }
  validates :unique_code, uniqueness: true, length: { is: 6 }

  has_many :guests

  scope :awaiting, -> { where(rsvp: "Awaiting RSVP") }
  scope :attending, -> { where(rsvp: "Attending") }
  scope :not_attending, -> { where(rsvp: "Not Attending") }

  private

  def set_defaults
    self.rsvp = "Awaiting RSVP"
  end

  def set_unique_code
    self.unique_code = 6.times.map { [*'0'..'9'].sample }.join
  end
end
