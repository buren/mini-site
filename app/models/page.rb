class Page < ActiveRecord::Base
  attr_accessible :header_priority, :home_id, :permalink, :template, :title
  belongs_to :home
  has_many :posts

  validates_uniqueness_of :permalink, :title
  validates_inclusion_of :template, in: %w(blog gallery home static), allow_nil: false
end
