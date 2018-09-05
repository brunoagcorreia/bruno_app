class UserMailer < ApplicationMailer
  default from: "bruno@correia.space"

  def order_confirmation(user, product)
    @product = product
    @appname = "Magical Music Shop"
    mail(to: user.email, subject: "Your order from #{@appname}")
  end

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'bruno@correia.space',
         subject: "A new message from #{name}")
  end

  def welcome(user)
    @appname = "Magical Music Shop"
    mail(to: user.email,
         subject: "Thanks for your registration at #{@appname}!")
  end
end
