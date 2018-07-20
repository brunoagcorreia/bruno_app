class UserMailer < ApplicationMailer
  default from: "bruno@correia.space"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'bruno@correia.space',
         subject: "A new contact form message from #{name}")
  end
end
