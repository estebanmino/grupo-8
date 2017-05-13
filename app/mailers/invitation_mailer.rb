class InvitationMailer < ApplicationMailer

  def invitation_mail(invitation, link)
    @user = User.find_by_id(invitation.sender_id)
    @invitation = invitation
    @email = invitation.email
    @link = link
    mail subject: "Invitación a LaLiga de: #{@user.full_name}", to: @email
  end

end
