class Guest < ApplicationRecord
  before_validation :titleize_name, :set_defaults, :set_unique_code, on: :create

  validates :name, presence: true, uniqueness: { case_sensitive: false}
  validates :rsvp, :inclusion => { :in => ["Awaiting RSVP" , "Attending", "Not Attending"] }
  validates :unique_code, uniqueness: true, length: { is: 6 }

  private

  def set_defaults
    self.rsvp = "Awaiting RSVP"
  end

  def titleize_name
    self.name = name.titleize
  end

  def set_unique_code
    self.unique_code = 6.times.map { [*'0'..'9'].sample }.join
  end
end
