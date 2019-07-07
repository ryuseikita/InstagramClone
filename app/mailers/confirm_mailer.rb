class ConfirmMailer < ApplicationMailer
  def confirm_mail(picture)
    @picture = picture

    mail to: "ryslsuzuki@gmail.com", subject: "投稿確認メール"
  end
end
