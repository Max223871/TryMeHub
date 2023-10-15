class RenameProductsToBlogposts < ActiveRecord::Migration[7.1]
  def change
    rename_table :products, :blogposts
  end
end
