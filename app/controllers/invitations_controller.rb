class InvitationsController < ApplicationController



  def create
    @invitation = Invitation.new(invitation_params) # Make a new Invite
    @invitation.sender_id = current_user.id
    @invitation.is_captain = false
    if @invitation.save
      InvitationMailer.invitation_mail(@invitation, new_user_registration(@invitation.token)).deliver_now
      redirect_to :back
    else
      redirect_to root_path
      # oh no, creating an new invitation failed
    end
  end

  private

    def invitation_params
      params.require(:invitation).permit(:email, :team_id)
    end

   def new_user_registration(token)
     "http://localhost:3000/signup?invitation_token=#{token}"
   end
end

#http://localhost:3000/signup?invitation_token=7f3603fe4f9cef8cde1572eb3a04d52b0485743e
