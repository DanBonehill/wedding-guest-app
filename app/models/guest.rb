class Guest < ApplicationRecord
  before_validation :capitalize_name, :set_defaults, :set_unique_code, on: :create

  validates :name, presence: true
  validates :rsvp, :inclusion => { :in => ["Awaiting RSVP" , "Attending", "Not Attending"] }
  validates :unique_code, uniqueness: true

  private

  def set_defaults
    self.rsvp = "Awaiting RSVP"
  end

  def capitalize_name
    self.name = name.capitalize
  end

  def set_unique_code
    self.unique_code = 6.times.map { [*'0'..'9'].sample }.join
  end
end
