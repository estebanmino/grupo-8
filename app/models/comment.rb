# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  post_id    :integer
#

class Comment < ApplicationRecord

  validates :content, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :post_id, presence: true, allow_blank: false

  belongs_to :user
  belongs_to :post

end
