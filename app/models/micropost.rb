class Micropost < ApplicationRecord
  belongs_to :user
  has_many_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [200,200]
  end
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes, message:   "should be less than 5MB" },
                      limit:        {min: 0, max: 4, message: "Please limit the number of images to no more than four"}

  scope :exist_records, -> { where(deleted_at: nil)}

  #ポストをいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  #いいねを解除する
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  #現在のユーザーがいいねしていたらtrueを返す
  def iine?(user)
    iine_users.include?(user)
  end
end
