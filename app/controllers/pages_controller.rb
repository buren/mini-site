class PagesController < ApplicationController
  def show
  	@page = Page.find_by_id(params[:id])
  	if @page.posts
  		@posts =  @page.posts.order('created_at desc').page(params[:page]).per(posts_per_page(@page.template))
  		@posts = @posts.published unless authenticated?
  		@posts = @posts.where(id: params[:editing_post_id]) unless params[:editing_post_id].blank?
  	else
  		@posts = []
  	end
		render_page
  end

  def home
  	@page = Page.find_by_template('home')
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

private

	def render_page
		if @page
			render 'pages/' + @page.template
		else
			render 'shared/page_not_found'
		end
	end

	def posts_per_page template
		case template
		when 'blog'
			10
		when 'gallery'
			4
		when 'home'
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
