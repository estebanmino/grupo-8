# frozen_string_literal: true

##
# Module for securing controllers access
module Secured
  extend ActiveSupport::Concern

  ##
  # Verify if current_user is logged_in
  def logged_in?
    redirect_to(root_path, notice: 'No autorizado!') unless current_user
  end

  #Verify if current_user is logged_in
  def is_admin_logged_in?
    redirect_to(root_path, notice: 'No autorizado!') unless (current_user && current_user.is_admin?)
  end
end
