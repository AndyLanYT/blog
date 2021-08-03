class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, length: {in: 2..20}
  validates :password, length: {in: 4..12}

  after_initialize {
    self.isBanned = false
  }
end
