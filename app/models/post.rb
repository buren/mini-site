class Post < ActiveRecord::Base
  attr_accessible :content, :page_id, :title, :page, :published, :image_holder
  belongs_to :page

  scope :all_posts
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :recent, -> { where(published: true).order('created_at desc').limit(10) }
  validates_presence_of :page
end
