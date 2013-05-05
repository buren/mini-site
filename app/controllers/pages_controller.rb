class PagesController < ApplicationController
  def show
  	@page = Page.find_by_id(params[:id])
  	if @page.posts
  		@posts =  @page.posts.order('created_at desc')
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

	def construct_params
		mercury_params = {
			page_id: params[:content][:page_id][:value],
			post_id: params[:content][:post_id][:value],
			title: params[:content][:post_title][:value],
			content: params[:content][:post_content][:value],
		}
	end

end
