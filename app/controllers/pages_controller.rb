class PagesController < ApplicationController
  include PagesHelper

  def show
  	@page = Page.find_by_permalink(request.path[1..100])
    find_page_posts


	render_page
  end

  def home
  	@page = Page.find_by_template('home')
    render_404 and return if @page.nil?
    find_page_posts
    render_page
  end

  def update
  	mercury_params = construct_params
	  post = Post.find(mercury_params[:post_id])

		post.title = mercury_params[:title]
	  post.content = mercury_params[:content]
	  post.page_id = mercury_params[:page_id]

    post.image_holder = make_fancybox_friendly(post.id, mercury_params[:image_holder])
    post.gallery =      make_fancybox_friendly(post.id, mercury_params[:gallery])

    post.published = true
	  post.save!
	  render text: ""
  end

  def destroy
  end

  def find_page_by_permalink
    @page = Page.find_by_permalink(request.path[1..100])
    render_404 and return if @page.nil?
    find_page_posts
    render_page
  end

private

  def find_page_posts
    @posts = Post.none
    return if @page.nil? or @page.posts.empty?

    @posts =  @page.posts.order('created_at desc').page(params[:page]).per(posts_per_page(@page.template))
    @posts = @posts.published unless authenticated?
    @posts = @posts.where(id: params[:editing_post_id]) unless params[:editing_post_id].blank?
  end

	def render_page
		if @page
      template = @page.template
      template = 'blog' if template.eql?('home')
			render 'pages/' + template
		else
			render_404 and return
		end
	end

	def posts_per_page template
		case template
		when 'blog'
			10
		when 'gallery'
			4
		else
			1000
		end
	end

	def construct_params
    content = params[:content]
    content[:post_gallery] ||= {}

		mercury_params = {
			page_id:      content[:page_id][:value],
			post_id:      content[:post_id][:value],
			title:        content[:post_title][:value],
			content:      content[:post_content][:value],
      image_holder: content[:post_image_holder][:value],
      gallery:      content[:post_gallery][:value]
		}
	end

  private

    def make_fancybox_friendly post_id, html
      fancy_images = Array.new
      Nokogiri::HTML(html).xpath("//img/@src").each do |src|
        fancy_images << wrap_for_fancybox(post_id, sanitize_mercury_image_field(src.value))
      end
      fancy_images.join("")
    end

    def wrap_for_fancybox post_id, img_src
      view_context.link_to(view_context.image_tag(img_src), img_src, class: 'fancybox', rel: "gallery-#{post_id}")
    end

    def sanitize_mercury_image_field field
      field.gsub(/\\/, '').gsub(/"/, '')
    end

end
