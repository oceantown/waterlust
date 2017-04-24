class Post < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, styles: { medium: "500x500>", small: "250x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
