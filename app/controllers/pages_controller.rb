class PagesController < ApplicationController

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
	  post = Post.find_by_id(mercury_params[:post_id])
		post = Post.new if post.nil?

		post.title = mercury_params[:title]
	  post.content = mercury_params[:content]
	  post.page_id = mercury_params[:page_id]
    post.image_holder = mercury_params[:image_holder]
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
		mercury_params = {
			page_id: content[:page_id][:value],
			post_id: content[:post_id][:value],
			title: content[:post_title][:value],
			content: content[:post_content][:value],
      image_holder: content[:post_image_holder][:value]
		}
	end

end
