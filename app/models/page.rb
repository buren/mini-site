class Page < ActiveRecord::Base
  attr_accessible :header_priority, :home_id, :permalink, :template, :title
  belongs_to :home
  has_many :posts

  TEMPLATES = %w(blog gallery home static)

  validates_presence_of :home
  validates_uniqueness_of :permalink, :title
  validates_inclusion_of :template, in: TEMPLATES, allow_nil: false

  def to_param
    "#{id} #{permalink}".parameterize
  end

  def has_home_page?
    Page.find_by_template 'home'
  end

end
