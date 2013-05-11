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

  form do |f|
    f.inputs "Site settings" do
      f.input :site_title
      f.input :site_author
      f.input :google_analytics_code, hint: 'Your google Analytics code goes here (UA-XXXXXXXX-Y)', placeholder: 'Need for Google Analytics'
      f.input :domain, hint: 'Set your sites domain (example.com)', placeholder: 'Need for Google Analytics'
    end
    f.actions
  end

end
