require 'rails_helper'

RSpec.describe "Static Pages", type: :request do
  
  describe "GET root" do
    it "responds successfully with an HTTP 200 status code" do
      get root_path
      
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "renders the index template" do
      get root_path
      
      expect(response).to render_template("index")
    end
  end
  
  describe "GET /rsvp" do
    it "responds successfully with an HTTP 200 status code" do
      get "/rsvp"
      
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "render the rsvp template" do
      get "/rsvp"
      
      expect(response).to render_template("rsvp")
    end
  end
end