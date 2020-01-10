class Tweet < ApplicationRecord
  belongs_to :user
  acts_as_votable
  scope :desc, -> {
    order("tweet.id DESC")
  }
end
