class Guest < ApplicationRecord
  before_validation :titleize_name, on: :create

  validates :name, presence: true, uniqueness: { case_sensitive: false}

  belongs_to :invitation

  private

  def titleize_name
    self.name = name.titleize
  end
end
