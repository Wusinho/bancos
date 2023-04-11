class HomepagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @welcome = 'Hello User'
  end
end
