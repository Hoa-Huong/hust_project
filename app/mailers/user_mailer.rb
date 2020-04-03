class UserMailer < ApplicationMailer
  def notify_status_demand user, demand
    @user = user
    @demand = demand
    mail to: user.email, subject: t("title_mail_status_demand")
  end

  def notify_status_teach_demand user
    @user = user
    mail to: user.email, subject: t("title_mail_status_demand")
  end

  def notify_status_teach_offer teacher, teach_offer
    @teacher = teacher
    @teach_offer = teach_offer
    mail to: teacher.user_email, subject: t("title_mail_status_teach_offer")
  end

  def send_invitation_to_teacher teacher, invite
    @teacher = teacher
    @invite = invite
    mail to: teacher.user_email, subject: t("title_send_invitation")
  end

  def send_notification_invitation_to_demander invite_item
    @invite_item = invite_item
    mail to: @invite_item.demand.user_email, subject: t("title_send_notification_invitation_to_demander")
  end
end
