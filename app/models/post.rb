# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Post < ApplicationRecord

  validates :description, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  belongs_to :user
  has_many :comments, dependent: :destroy
end
