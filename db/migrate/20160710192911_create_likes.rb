class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :comment, index: true
      t.references :user, index: true
    end
  end
end
