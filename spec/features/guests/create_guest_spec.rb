require 'rails_helper'

RSpec.feature('Create a new guest') do

  scenario "a user views new guest link" do
    visit guests_path

    expect(page).to have_link("New Guest", new_guest_path)
  end

  context 'from the new form' do
    before do
      visit new_guest_path
    end

    scenario "with valid attributes" do
      expect(page).to have_field("Name")

      fill_in "name", with: "Daniel"
      click_button "Submit"

      expect(page).to have_content("Guest created successfully")
      expect(response).to redirect_to(guests_path)
      expect(Guest.count).to eq(1)
    end

    scenario "with invalud attributes" do
      fill_in "name", with: ""
      click_button "Submit"

      expect(page).to have_content("Guest created successfully")
      expect(page).to have_content("errors prevented creation")
      expect(response).to render_template(:new)
      expect(Guest.count).to eq(0)
    end
  end
end
