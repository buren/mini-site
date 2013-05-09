ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ 'Dashboard' } do
    panel "Pages" do
      table_for Page.order(:title) do
        column 'Title' do |page|
          link_to page.title, admin_page_path(page)
        end
        column 'Number of posts' do |page|
          page.posts.count
        end
        column 'Latest posts' do |page|
          raw page.posts.limit(5).map { |post| link_to post.title, admin_post_path(post) }.join(', ')
        end
        strong { link_to "All pages", admin_pages_path }
      end
    end

    columns do
      column do
        panel "Recent Posts" do
          table_for Post.order("created_at desc").limit(15) do
            column "Page" do |post|
               link_to post.page.title, admin_page_path(post.page)
            end
            column "Title" do |post|
               link_to post.title, admin_post_path(post)
            end
            column "Content" do |post|
              raw (truncate(post.content, :length => 250, :omission => '...'))
            end
            strong { link_to "All posts", admin_posts_path }
          end
        end
      end

    end
  end # content
end
