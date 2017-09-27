class InvitationMailer < ApplicationMailer
  default from: 'dan@danbethwedding.com'

  def invitation_updated(invitation)
    @invitation = invitation
    @url = "http://danbethwedding.com/invitations/#{@invitation.id}"
    mail(to: "danbonehill@me.com", subject: "#{@invitation.guests.first.name} has RSVP'd")
  end

  def reminder_email(invitation)
    mail(to: "#{invitation.email}", subject: "Dan & Beth's Wedding - Tomorrow!")
  end
end
