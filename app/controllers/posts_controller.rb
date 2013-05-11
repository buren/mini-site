class PostsController < ApplicationController

	def create
		post = Post.create!(page: Page.find_by_id(params[:post][:page_id]), published: false)
		redirect_to "/editor#{params[:post][:url]}?editing_post_id=#{post.id}" and return
	end

	def destroy
		post = Post.find(params[:id])
    post_page = post.page
    post.destroy
		redirect_to page_path(post_page)
	end

  def destroy_unpublished
    Post.unpublished.destroy_all
    flash[:notice] = "All unpublished posts destroyed"
    redirect_to admin_posts_path
  end

end
