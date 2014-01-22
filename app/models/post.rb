class Post < ActiveRecord::Base

  has_many :comments
  scope :published, -> { where(published: true) }

end
