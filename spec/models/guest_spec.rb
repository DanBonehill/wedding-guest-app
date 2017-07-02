require 'rails_helper'

RSpec.describe Guest, type: :model do
  
  before do
    @guest = Guest.create(name: "Dan")
  end
  
  it "is valid" do
    expect(@guest).to be_valid
  end
  
  it "has name attribute" do
    @guest.name = nil
    @guest.save
    
    expect(@guest).not_to be_valid
  end
  
  it "name is capitalized" do
    @guest.name = "dan"
    @guest.save
    
    expect(@guest.name).to eq(@guest.name.capitalize)
  end
  
  it "has rsvp of 'Awaiting RSVP'" do
    expect(@guest.rsvp).to eq("Awaiting RSVP")
  end
  
  it "rsvp can only equal 'Awaiting RSVP', 'Attending' or 'Not Attending'" do
    @guest.rsvp = "aaaa"
    @guest.save
    
    expect(@guest).not_to be_valid
  end
  
  it "has unique_code" do
    expect(@guest.unique_code).not_to eq(nil)
    expect((@guest.unique_code.to_s).length).to eq(6)
  end
  
  it "unique_code is unique" do
    @guest.unique_code = 123456
    @guest.save
    
    @dupguest = Guest.create(name: "Bob")
    @dupguest.unique_code = 123456
    @dupguest.save
    
    expect(@dupguest).not_to be_valid
  end
  
  it "is valid with email attribute" do
    @guest.email = "Dan@example.com"
    @guest.save
    
    expect(@guest).to be_valid
  end
  
  it "is valid without email attribute" do
    @guest.email = nil
    @guest.save
    
    expect(@guest).to be_valid
  end
end
