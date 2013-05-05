ActiveAdmin.register Page do

  index do
    selectable_column
    column "Title", sortable: :title do |page|
      content_tag :h2 do
        link_to page.title, admin_page_path(page)
      end
    end
    column "Header priority", sortable: :header_priority do |page|
      content_tag :h2, page.header_priority
    end
    column "Posts" do |page|
      content_tag :h2 do
        link_to page.posts.count, admin_posts_path
      end
    end
    default_actions
  end
	
	form do |f|
    f.inputs "Page" do
      f.input :title
      f.input :permalink
      f.input :header_priority
      f.input :template, as: :select, collection: Page::TEMPLATES
      f.input :home_id, as: :hidden, value: Home.first ? Home.first.id : nil
    end
    f.actions
  end

end
