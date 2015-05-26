class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user, index: true
      t.references :activity, index: true
      t.datetime :start_at
      t.datetime :end_at
    end
    add_foreign_key :actions, :users
    add_foreign_key :actions, :activities
  end
end
