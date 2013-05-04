class Home < ActiveRecord::Base
  attr_accessible :site_author, :site_title
  validates_uniqueness_of :id # only allow one
  has_many :pages
end
