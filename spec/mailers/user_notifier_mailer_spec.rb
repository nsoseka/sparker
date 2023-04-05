require "rails_helper"

RSpec.describe UserNotifierMailer, type: :mailer do
  let!(:user) { create(:user) }
  let(:mailer) { described_class.send_account_deletion_email(user.email, user.display_name)}

  describe 'Enqueue job' do
    it "shoud enqueue job" do
      expect do
        described_class.send_account_deletion_email(user.email, user.display_name).deliver_later
      end.to have_enqueued_job(ActionMailer::MailDeliveryJob)
    end
  end

  it 'send good by message' do
    user = create(:user)

     expect do
       described_class.send_account_deletion_email(user.email, user.display_name).deliver
     end.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  describe '.email_recipient' do
    subject { mailer.email_recipient }

    context 'given a user with an email' do
      it 'returns the correct email' do
        expect(mailer.to).to eq([user.email])
      end
    end

    context 'given a valid user' do
      it 'returns the correct email' do
        expect(mailer.subject).to eq("Thanks for sticking around, we will miss you!")
      end
    end
  end
end
