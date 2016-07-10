class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: "Comment"
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  has_many   :likes
  private

    def self.comment_parent
      where(parent_id: nil)
    end
end