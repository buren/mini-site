class Home < ActiveRecord::Base
  attr_accessible :site_author, :site_title
  has_many :pages

  after_destroy :restore_home

private
	
	def restore_home
		home = Home.create!(
			site_author: 'Site author',
			site_title: 'Site title'
		)
		Page.all.each do |page|
			page.home = home
			page.save!
		end
	end

end