class Page < ActiveRecord::Base

  attr_accessible :header_priority, :home_id, :permalink, :template, :title
  belongs_to :home
  has_many :posts, dependent: :destroy

  TEMPLATES = %w(blog gallery home static)

  validates_presence_of :home
  validates_presence_of :permalink, :title
  validates_uniqueness_of :permalink, :title
  validates_inclusion_of :template, in: TEMPLATES, allow_nil: false

  def sorted_posts
    posts.order('created_at DESC')
  end

  def to_param
    if $request_path.include? "admin"
      "#{id}"
    else
      "#{permalink}".parameterize
    end
  end

end
