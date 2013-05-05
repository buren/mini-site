class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :header_links
  helper_method :authenticated?, :authenticated_for_edit?, :is_editing?, :not_editing?

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


end
