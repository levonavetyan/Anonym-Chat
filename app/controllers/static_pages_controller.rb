class StaticPagesController < ApplicationController
  def home
    @tweets = Tweet.all
  end

  def help
  end
end
