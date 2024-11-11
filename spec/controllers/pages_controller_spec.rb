require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe "GET #home" do
    before { get :home }

    it { expect(response).to be_successful }
    it { expect(response).to have_http_status(:ok) }
    it { expect(response).to render_template(:home) }
  end
end
