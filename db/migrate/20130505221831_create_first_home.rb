class CreateFirstHome < ActiveRecord::Migration
  def up
  	Home.create(
  		site_author: 'Site author',
  		site_title: 'Site title'
		)
  end

  def down
  end
end
