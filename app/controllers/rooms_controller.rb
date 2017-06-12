class RoomsController < ApplicationController
  def show
    @alerts = Alert.all
  end
end
