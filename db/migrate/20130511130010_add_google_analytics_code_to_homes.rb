class AddGoogleAnalyticsCodeToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :google_analytics_code, :string
    add_column :homes, :domain, :string
  end
end
