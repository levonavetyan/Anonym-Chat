class AddSubjectToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :subject, :text
  end
end
