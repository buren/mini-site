ActiveAdmin.register Page do
	
	form do |f|
    f.inputs "Page" do
      f.input :title
      f.input :permalink
      f.input :header_priority
      f.input :template, as: :select, collection: Page::TEMPLATES
      f.input :home_id, as: :hidden, value: Home.first ? Home.first.id : nil
    end
    f.actions
  end

end
