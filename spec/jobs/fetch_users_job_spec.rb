require 'rails_helper'

RSpec.describe FetchUsersJob, type: :job do
  describe "GET /index triggers a fetch job" do
    let(:user) { create(:user) }

    it "renders a successful response" do

      # create user fires turbostream job and then we manually enqueue our job
      FetchUsersJob.perform_later(user)
      expect(Delayed::Job.count).to eq 2
    end
  end
end
