class Post < ApplicationRecord
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/plant_ivy.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
end