ActiveAdmin.register Post do
	scope :all_posts, :default => true
	scope :published
	scope :unpublished

	index do
		selectable_column
	  column "Title", sortable: :title do |post|
	    link_to post.title, admin_post_path(post)
	  end
	  column "Content" do |post|
	    post.content.html_safe
	  end
	  column "Page" do |post|
	    link_to post.page.title, admin_post_path(post)
	  end
	  default_actions
	end


end
