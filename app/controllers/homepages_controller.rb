class HomepagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @provider_size = current_user.provider_size
    @banks_size = current_user.banks_size
  end
end
