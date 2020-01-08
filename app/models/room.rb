class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :title, presence: true, uniqueness: true
end
