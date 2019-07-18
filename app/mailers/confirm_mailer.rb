class ConfirmMailer < ApplicationMailer
  def confirm_mail(picture)
    @picture = picture

    mail to: @picture.user.email, subject: "投稿確認メール"
  end
end
