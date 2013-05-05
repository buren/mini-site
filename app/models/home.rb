class Home < ActiveRecord::Base
  attr_accessible :site_author, :site_title
  has_many :pages
end
