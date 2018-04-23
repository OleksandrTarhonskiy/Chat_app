class UserMailer < ActionMailer::Base
  default :from => 'targonsky97@gmail.com'

  def registration_confirmation(user, origin)
    @user = user
    @origin = origin
    mail(:to => "<#{user.email}>", :subject => "Registration Confirmation")
  end
end
