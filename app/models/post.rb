class Post < ActiveRecord::Base
  attr_accessible :content, :page_id, :title, :page, :published
  belongs_to :page

  scope :all_posts
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  validates_presence_of :page
end
