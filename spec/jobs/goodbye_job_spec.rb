require 'rails_helper'

RSpec.describe GoodbyeJob, type: :job do
  describe "Destroying a user triggers good bye job" do
    it "enqueues job for one delete" do
      user = FactoryBot.create(:user)

      # triggers turbo stream
      expect(Delayed::Job.count).to eq 1

      # triggers goodbye
      user.destroy
      expect(Delayed::Job.count).to eq 2
    end

    it "mass delete triggers emails for all deleted users" do
      FactoryBot.create(:user)
      FactoryBot.create(:user)
      FactoryBot.create(:user)

      # triggers turbo stream
      expect(Delayed::Job.count).to eq 3

      # triggers goodbye
      User.destroy_all
      expect(Delayed::Job.count).to eq 6
    end
  end
end
