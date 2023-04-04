class GoodbyeJob < ApplicationJob
  queue_as :default

  def perform(email, display_name)
    # Do something later
    UserNotifierMailer.send_account_deletion_email(email, display_name).deliver
  end
end
