class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attr_accessor :signin
  attr_accessor :current_password
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:signin)
      where(conditions).where(["lower(nickname) = :value OR lower(email) = 
      :value", {:value => login.strip.downcase }]).first
    end 
  validates :nickname, :uniqueness => {:case_sensitive => false}       
end
