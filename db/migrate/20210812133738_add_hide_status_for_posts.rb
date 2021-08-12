class AddHideStatusForPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :isHidden, :boolean, default: false
  end
end
