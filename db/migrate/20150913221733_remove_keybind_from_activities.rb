class RemoveKeybindFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :key_bind, :text
  end
end
