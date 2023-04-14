module HomepagesHelper

  def navbar_if_signed_in
    return unless user_signed_in?

    render 'shared/navbar'
  end

  def special_green_btn
    'bg-gradient-to-b from-teal-600 to-green-500  hover:bg-gradient-to-l hover:from-teal-600 hover:to-green-500 text-gray-200  p-2 rounded hover:text-gray-100'
  end

end
