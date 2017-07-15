class Invitation < ApplicationRecord
  before_validation :set_defaults, :set_unique_code, on: :create

  validates :rsvp, :inclusion => { :in => ["Awaiting RSVP" , "Attending", "Not Attending"] }
  validates :unique_code, uniqueness: true, length: { is: 6 }

  has_many :guests, dependent: :destroy

  scope :awaiting, -> { where(rsvp: "Awaiting RSVP") }
  scope :attending, -> { where(rsvp: "Attending") }
  scope :not_attending, -> { where(rsvp: "Not Attending") }

  def self.total_guest_count
    guests_count = [0]
    Invitation.all.each do |invitation|
      guests_count.push(invitation.guests.count)
    end
    guests_count.reduce(:+)
  end

  def self.attending_guest_count
    guests_count = [0]
    Invitation.where(rsvp: "Attending").each do |invitation|
      guests_count.push(invitation.guests.count)
    end
    guests_count.reduce(:+)
  end

  def self.not_attending_guest_count
    guests_count = [0]
    Invitation.where(rsvp: "Not Attending").each do |invitation|
      guests_count.push(invitation.guests.count)
    end
    guests_count.reduce(:+)
  end

  def self.awaiting_rsvp_guest_count
    guests_count = [0]
    Invitation.where(rsvp: "Awaiting RSVP").each do |invitation|
      guests_count.push(invitation.guests.count)
    end
    guests_count.reduce(:+)
  end

  private

  def set_defaults
    self.rsvp = "Awaiting RSVP"
    self.email = nil
  end

  def set_unique_code
    self.unique_code = 6.times.map { [*'0'..'9'].sample }.join
  end
end
