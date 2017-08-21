class GiftListMailer < ApplicationMailer
  def list_created(invitation)
    mail(to: "#{invitation.email}", subject: "Dan & Beth's Wedding - Gift List")
  end
end
