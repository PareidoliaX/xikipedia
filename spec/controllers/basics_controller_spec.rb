require "rails_helper"

RSpec.describe BasicsController, type: :controller do

  describe "GET #splash" do
    it "responds successfully with an HTTP 200 status code" do
      get :splash
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :splash
      expect(response).to render_template("splash")
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :about
      expect(response).to render_template("about")
    end
  end
  
end