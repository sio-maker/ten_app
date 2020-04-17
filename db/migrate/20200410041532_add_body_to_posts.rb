class AddBodyToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :body, :text
    add_column :posts, :day, :integer, default:0
  end
end
