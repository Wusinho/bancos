module HomepagesHelper

  def navbar_if_signed_in
    return unless user_signed_in?

    render 'shared/navbar'
  end

end
