class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :site_title
      t.string :site_author

      t.timestamps
    end
  end
end
