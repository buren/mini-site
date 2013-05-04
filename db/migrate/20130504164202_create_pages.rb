class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :template
      t.integer :header_priority
      t.string :title
      t.string :permalink
      t.integer :home_id

      t.timestamps
    end
  end
end
