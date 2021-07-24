class CreateListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :list_items do |t|
      t.string :label
      t.string :group
      t.boolean :completed

      t.timestamps
    end
  end
end
