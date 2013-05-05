class Post < ActiveRecord::Base
  attr_accessible :content, :page_id, :title, :page, :published
  belongs_to :page

  validates_presence_of :page
end
