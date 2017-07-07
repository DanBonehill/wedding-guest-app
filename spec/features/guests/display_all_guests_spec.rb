require 'rails_helper'

RSpec.feature 'Displaying all guests' do
  before do
    @guest_1 = Guest.create(name: "Dan")
    @guest_2 = Guest.create(name: "Beth")
    @guest_3 = Guest.create(name: "Emma")
  end

  scenario 'a user views all guests' do
    visit guests_path

    expect(page).to have_content(@guest_1.name)
    expect(page).to have_content(@guest_1.rsvp)
    expect(page).to have_content(@guest_1.unique_code)
    expect(page).to have_content(@guest_2.name)
    expect(page).to have_content(@guest_2.rsvp)
    expect(page).to have_content(@guest_2.unique_code)
    expect(page).to have_content(@guest_3.name)
    expect(page).to have_content(@guest_3.rsvp)
    expect(page).to have_content(@guest_3.unique_code)
  end

  scenario 'a non-user views all guests' do
    #visit guests_path

    #expect(page).not_to have_content(@guest_1.name)
    #expect(page).to have_content("You are not authorised to view this page.")
  end
end
