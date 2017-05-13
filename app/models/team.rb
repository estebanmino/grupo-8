# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  points            :integer
#  won               :integer
#  lost              :integer
#  tie               :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :points, :numericality => { :greater_than_or_equal_to => 0 }
  validates :won, :numericality => { :greater_than_or_equal_to => 0 }
  validates :lost, :numericality => { :greater_than_or_equal_to => 0 }

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_many :visit_matches, :class_name => 'Match', :foreign_key => 'visit_team_id'
  has_many :home_matches, :class_name => 'Match', :foreign_key => 'home_team_id'

  has_many :users
  belongs_to :division
  has_and_belongs_to_many :tournaments

  



end
