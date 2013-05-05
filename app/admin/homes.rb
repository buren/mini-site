ActiveAdmin.register Home do

	index do
	  column "Site Title" do |home|
	    home.site_title
	  end
	  column "Site Author" do |home|
	    home.site_author
	  end
	  default_actions
	end

end
