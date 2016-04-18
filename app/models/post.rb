class Post < ActiveRecord::Base
  
  belongs_to :user
  
  
  scope :recent, -> { order('published_at desc') }
  scope :published, -> { where(published: true) }
  
  extend FriendlyId
    friendly_id :title, use: :slugged
end
