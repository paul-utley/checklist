class AddUserIdToListItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :list_items, :user, null: false, foreign_key: true
  end
end
