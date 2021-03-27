class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable, dependent: :destroy
  has_one :comment, as: :commentable, dependent: :destroy

  def liked?(user_id)
    Like.where(user_id: user_id, likeable_id: id, likeable_type: self.class.name).exists?
  end
end