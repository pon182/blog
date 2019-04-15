class AddTitleToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :title, :text
  end
end
