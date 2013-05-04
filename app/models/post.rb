class Post < ActiveRecord::Base
  attr_accessible :content, :page_id, :title
  belongs_to :page
end
