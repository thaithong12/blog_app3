class BookMailer < ApplicationMailer
    def user_to_admin_email(user,subject, book)
        @user = user
        @book = book
        mail(to: @user.email, subject: subject)
    end

    def admin_to_user_email(user,subject)
        @user = user
        mail(to: @user.email, subject: subject)
    end
end
