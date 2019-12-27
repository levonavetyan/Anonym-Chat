class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages
  has_many :chatrooms, through: :messages

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :tumoid, presence: true, uniqueness: true
end
