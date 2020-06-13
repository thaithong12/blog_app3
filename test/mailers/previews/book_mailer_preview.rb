# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview
    def user_to_admin_email_preview
        BookMailer.user_to_admin_email(User.first, "Thankyou", Book.first)
    end
    def admin_to_user_email_preview
        BookMailer.admin_to_user_email(User.last, "Thankyou")
    end
      
end
