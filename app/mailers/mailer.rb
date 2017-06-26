class Mailer < ApplicationMailer

  def invitation_mail(invitation, link)
    @user = User.find_by_id(invitation.sender_id)
    @invitation = invitation
    @email = invitation.email
    @link = link
    mail subject: "Invitación a LaLiga de: #{@user.full_name}", to: @email
  end

  def comment_mail(user_from, user_to, content, post)
    @user_from = user_from
    @user_to = user_to
    @content = content
    @post = post
    mail subject: "Comentario de tu Post de: #{@user_from.full_name}", to: @user_to.email
  end


end
