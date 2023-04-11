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
end
