class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :providers

  def own_banks
    Bank.where({provider: providers})
  end

  def banks_size
    own_banks.length
  end

  def provider_size
    providers.length
  end

end
