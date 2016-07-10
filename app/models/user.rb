class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :likes

  def likes?(comment)
    comment.likes.where(user_id: id).any?
  end
  
  def name
    if last_name.blank?
      first_name
    else
      first_name + " " + last_name
    end
  end
end
