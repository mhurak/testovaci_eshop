class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :category
  scope :published, -> { where(published: true) }

end
