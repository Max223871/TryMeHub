class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :terms_and_conditions, :boolean
  end
end
