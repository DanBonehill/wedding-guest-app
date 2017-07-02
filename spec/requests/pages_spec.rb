require 'rails_helper'

RSpec.describe "Static Pages", type: :request do
  
  describe "GET /" do
    it "displays home page with a response of 200" do
      get root_path
      
      expect(response.status).to eq 200
      # expect(page).to have_content()
    end
  end
end