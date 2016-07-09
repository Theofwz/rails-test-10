class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: "Comment"
  has_many   :replies, class_name: "Comment", foreign_id: :parent_id, class_name: "Comment", dependent: :destroy
end