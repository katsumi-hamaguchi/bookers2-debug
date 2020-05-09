class ThanksMailer < ApplicationMailer
	def send_when_signup(user)
    @user = user
    mail to: user.email, subject:"登録完了のご連絡"
  end
end
