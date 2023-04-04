class UserNotifierMailer < ApplicationMailer
  default :from => 'sadtoseeyougoress@thesparklooper.com'

  # send a account_deletion email to the user, pass in the user object that   contains the user's email address
  def send_account_deletion_email(email, display_name)
    @email = email
    @display_name = display_name
    mail( :to => @email,
    :subject => 'Thanks for sticking around, we will miss you!' )
  end
end
