class InstMailer < ApplicationMailer
  def inst_mail(inst)
    @inst = inst

    mail to: @inst.user.email, subject: "お問い合わせの確認メール"
  end
end
