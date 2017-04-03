class WelcomeController < ApplicationController
  def index
    flash[:warning] = "good"
  end
end
