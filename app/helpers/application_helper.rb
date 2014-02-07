module ApplicationHelper

	def render_editable_content element, content, html_options, mercury_type, data_options = { data: {} }
		unless authenticated_for_edit?
			html_options.merge!({ contenteditable: false })
			return content_tag element, content, html_options, data_options[:data]
		end
		data_options[:data].merge!(mercury: mercury_type)
		html_options.merge!({ contenteditable: true })
		html_options.merge!(data_options)
		return content_tag element, content, html_options
	end


	def paginate_posts
		return "" if @posts.length.eql? 0
		content_tag :p, class: 'pagination' do
			paginate @posts, window: 2
		end
	end

end
