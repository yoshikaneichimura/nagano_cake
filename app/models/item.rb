class Item < ApplicationRecord

  has_one_attached :image

  # def get_image(height,width)
    # unless image.attached?
      # file_path = Rails.root.join('app/assets/images/no_image.jpg')
      # image.attach(io:File.open(file_path),filename:'default-image.jpg',cotent_type:'image/jpeg')
    # end
    # image
  # end

  belongs_to :genre
  has_many :order_details,dependent: :destroy
  has_many :cart_items,dependent: :destroy


  def with_tax_price
    (price * 1.1).floor
  end



end
