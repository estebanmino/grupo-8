# == Schema Information
#
# Table name: tournaments
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           not null
#  season      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  division_id :integer
#

class Tournament < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true
  validates :season, presence: true

  has_many :matches
  belongs_to :division
  has_and_belongs_to_many :teams
end
