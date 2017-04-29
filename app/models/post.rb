class Post < ApplicationRecord

  validates :description, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  belongs_to :user
  has_many :comments
end
