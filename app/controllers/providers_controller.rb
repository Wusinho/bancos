class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:show, :edit, :destroy, :update]
  def index
    @provider = Provider.new
    @provider.banks.build
    @providers = current_user.providers.paginate(page: params[:page], per_page: 10)
  end

  def show
    @banks = @provider.banks
  end

  def edit
  end

  def create
    p '*'*100
    p params
    p '*'*100
    @provider = current_user.providers.build(provider_params)

    if @provider.save
      provider = Provider.new
      provider.banks.build
      streams = []
      streams << turbo_stream.prepend('providers', partial: 'providers/provider', locals: { provider: @provider })
      streams << turbo_stream.replace('provider_form', partial: 'providers/form', locals: { provider: provider } )
      streams << turbo_stream.replace('message', partial: 'shared/message', locals: { message: "#{@provider.name} created"})
      render turbo_stream: streams
    else
      turbo_error_message(@provider)
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_path
  end

  def update
    if @provider.update(provider_params)
      redirect_to provider_path(@provider)
    else
      turbo_error_message(@provider)
    end
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :phone, banks_attributes: [:account, :name, :_destroy])
  end
end
