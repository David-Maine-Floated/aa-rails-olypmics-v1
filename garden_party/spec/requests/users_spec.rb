require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users (#create)" do
    context "with valid params" do
      it "redirects to the garden index page after a user is created" do
        post users_url, params: {
          user: {
            username: "Farm4Life"
          }
        }
        expect(User.exists?(username: "Farm4Life")).to be true
        expect(response).to redirect_to(gardens_url)
      end
    end

    context "with invalid params" do
      it "renders the new template if a user cannot be created" do
        post users_url, params: {
          user: {
            username: ""
          }
        }
        expect(User.exists?(username: "")).to be false
        expect(response.body).to include("Create a new User!")
      end
    end
  end
end
