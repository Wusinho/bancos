class ProvidersController < ApplicationController
  def index
    @providers = current_user.providers.preload(:banks)
  end

  def create
  end
end
