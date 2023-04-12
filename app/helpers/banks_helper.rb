module BanksHelper

  def submit_bank_form(bank)
    if bank.persisted?
      button_to('Update Bank', '', class: blue_btn)
    else
      button_to('Create Bank', '', class: blue_btn)
    end
  end
end
