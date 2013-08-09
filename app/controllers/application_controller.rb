class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :header_links, :set_request_path
  helper_method :authenticated?, :authenticated_for_edit?, :is_editing?, :not_editing?, :home_hash

  def header_links
  	@header_links = Home.first ? Home.first.pages.where('template != ?', 'home').order(:header_priority).limit(5) : []
	end

	def authenticated?
	  current_admin_user ? current_admin_user : false
	end

	def authenticated_for_edit?
	  return authenticated? unless authenticated?
	  is_editing?
	end

	def is_editing?
	  request.url.include?('preview=true') ? false : request.url.include?('mercury_frame=true')
	end

	def not_editing?
	  !is_editing?
	end

  def render_404
    render 'shared/page_not_found'
  end

  def home_hash
    return {} if Home.first.nil?
    home = Home.first
    {
      title: home.site_title,
      author: home.site_author,
      domain: home.domain,
      ga_code: home.google_analytics_code
    }
  end

private 

  def set_request_path
    $request_path = request.path
  end

end
