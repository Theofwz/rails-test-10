class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text        :content
      t.integer     :parent_id
      t.references  :user, index: true
      t.timestamps
    end
  end
end
