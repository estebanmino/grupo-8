class InvitationsController < ApplicationController
  before_action :is_current_user?, only: %i[create]



  def create
    @invitation = Invitation.new(invitation_params) # Make a new Invite
    @invitation.sender_id = current_user.id
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
      params.require(:invitation).permit(:email, :team_id, :is_captain)
    end

   def new_user_registration(token)
     if Rails.env == 'development'
       return "http://localhost:3000/signup?invitation_token=#{token}"
     elsif Rails.env == 'production'
       return "http://laliga.herokuapp.com/signup?invitation_token=#{token}"
     end

   end

   def is_current_user?
     redirect_to(root_path, notice: 'No autorizado a agregar jugadores!') unless (
                (current_user.team.id == Integer(invitation_params[:team_id]) && current_user.is_captain?) || is_admin_logged_in? )
   end

end

#http://localhost:3000/signup?invitation_token=7f3603fe4f9cef8cde1572eb3a04d52b0485743e
