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
    'text-teal-400 hover:text-green-500 no-underline hover:underline cursor-pointer transition ease-in duration-300'
  end

  def green_big_btn
    'w-full flex justify-center bg-gradient-to-b from-teal-600 to-green-500  hover:bg-gradient-to-l hover:from-teal-600 hover:to-green-500 text-gray-100 p-4  rounded-full tracking-wide font-semibold  shadow-lg cursor-pointer transition ease-in duration-500 -mx-3'
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

  def input_class_format
     "w-full -ml-4 pl-10 pr-3 py-2 rounded-lg border-2 border-gray-200 outline-none focus:border-indigo-500"
  end

  def form_field_with_label(f, label_text, field_name)
    content_tag :div, class: "pt-4" do
      f.label(label_text, class: "text-xs font-semibold px-1") +
        f.send(:text_field, field_name, class: input_class_format, autocomplete: "off")
    end
  end


  def check_box_with_label(bank_form, label_text)
    content_tag :div do
      bank_form.label(:_destroy, label_text) +
        bank_form.send(:check_box, :_destroy, class: check_box_css)
    end
  end

  def check_box_css
    'sq-checkbox h-4 w-4 bg-blue-500 focus:ring-green-400 border-gray-300 rounded'
  end

end

