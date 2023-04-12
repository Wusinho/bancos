module ApplicationHelper

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def navbar_links
    'inline-block no-underline hover:text-green-600 font-medium text-lg py-2 px-4 lg:-ml-2'
  end

  def blue_btn
    'text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800'
  end

  def red_btn
    'focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900'
  end

  def green_btn
    'text-white bg-green-700 hover:bg-green-800 focus:ring-4 font-medium rounded-lg px-5 py-2.5 mr-2 mb-2'
  end

  def yellow_btn
    'focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:focus:ring-yellow-900'
  end

  def edit_btn
    'fa fa-edit px-2'
  end

  def delete_btn
    "fa-solid fa-trash"
  end
end

