class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :attachment do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  enum status: { draft: 0, publish: 1, remove: 2 }

  def liked?(user_id)
    Like.where(user_id: user_id, likeable_id: id, likeable_type: self.class.name).exists?
  end

end
