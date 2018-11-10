class InstMailer < ApplicationMailer
  def inst_mail(inst)
    @inst = inst

    mail to: "samurai310@aol.jp", subject: "お問い合わせの確認メール"
  end
end
