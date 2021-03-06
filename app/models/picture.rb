# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  date               :date             not null
#  comment            :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  match_id           :integer
#

class Picture < ApplicationRecord
  validates :comment, presence: true



  has_attached_file :image,
  styles: { medium: "300x300>", thumb: "100x100>" },
  :storage => :cloudinary,
  path: "uploaded/:class/:attachment/:id/:style_:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :match
end
