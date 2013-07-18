ActiveAdmin.register Page do

  index do
    selectable_column
    column "Title", sortable: :title do |page|
        h2 { link_to page.title, admin_page_path(page) }
    end
    column "Header priority", sortable: :header_priority do |page|
      content_tag :h2, page.header_priority
    end
    column "Posts" do |page|
      h2 { link_to page.posts.count, admin_posts_path }
    end
    default_actions
  end

	form do |f|
    f.inputs "Page" do
      f.input :title
      f.input :permalink, as: :select,  collection: ['art', 'home', 'design', 'about', 'contact']
      f.input :header_priority, hint: 'Header ordering (1..5) if multiple pages have the same number they will be ordered alphabetically'
      f.input :template, as: :select, collection: Page::TEMPLATES
      f.input :home_id, as: :hidden, value: Home.first ? Home.first.id : nil
    end
    f.actions
  end

  show do |page|
    attributes_table do
      row :title
    end
    panel "Posts for #{page.title}" do
      table_for page.posts.recent do
        column do |post|
          link_to post.title, admin_post_path(post)
        end
      end
    end
    active_admin_comments
  end

end
