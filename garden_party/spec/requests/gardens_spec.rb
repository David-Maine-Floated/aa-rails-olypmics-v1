require 'rails_helper'

RSpec.describe "Gardens", type: :request do
  let(:user) do
    User.create!(username: "dynamic_dahlia")
  end

  subject(:garden) do
    Garden.create!(name: "dahlia's place", size: 120, garden_owner_id: user.id)
  end

  let(:garden2) do
    Garden.create!(name: "dahlia's daisies", size: 150, garden_owner_id: user.id)
  end

  describe "GET /gardens (#index)" do
    it "renders the index template and sets an @gardens variable for all Gardens in the database" do
      #  creating two gardens in the test database
      garden
      garden2
      get gardens_url
      expect(CGI.unescapeHTML(response.body)).to include("dahlia's place")
      expect(CGI.unescapeHTML(response.body)).to include("dahlia's daisies")
    end
  end

  describe "GET /gardens/:id (#show)" do
    it "renders the show template and sets an @garden variable for the Garden matching the params id" do
      get garden_url(garden), params: { id: garden.id }
      expect(response.body).to include("This is a garden!")
      expect(response.body).to include("Size: 120")
    end
  end

  describe "POST /gardens (#create)" do
    context "with valid params" do
      it "redirects to the garden's index page after a garden is created" do
        post gardens_url, params: {
          garden: {
            name: "dahlia's garden",
            size: 120,
            garden_owner_id: user.id
          }
        }
        expect(Garden.exists?(name: "dahlia's garden")).to be true
        expect(response).to redirect_to(gardens_url)
      end
    end

    context "with invalid params" do
      it "renders the new template if a garden does not NOT save to the database" do
        post gardens_url, params: {
          garden: {
            name: "",
            size: 120,
            garden_owner_id: user.id
          }
        }
        expect(Garden.exists?(name: "")).to be false
        expect(response.body).to include("Create a new Garden!")
      end
    end
  end
end
