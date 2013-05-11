ActiveAdmin.register Post do
	scope :all_posts, :default => true
	scope :published
	scope :unpublished

	index do
		selectable_column
	  column "Title", sortable: :title do |post|
	    strong { link_to raw(post.title), admin_post_path(post) }
	  end
	  column "Content" do |post|
	    raw post.content
	  end
	  column "Page" do |post|
	    strong { link_to post.page.title, admin_post_path(post) }
	  end
	  default_actions
	end

	action_item :only => :index do
    link_to 'Delete unpublished posts', destroy_unpublished_path, confirm: 'Are you sure you would like to remove ALL unpublished posts?'
  end

end
