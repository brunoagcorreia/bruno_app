# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("brunocorreia@gmail.com", "Bruno", "Alô Galera!!")
  end
end
