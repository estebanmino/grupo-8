# == Schema Information
#
# Table name: matches
#
#  id            :integer          not null, primary key
#  date          :date
#  time          :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  visit_team_id :integer
#  home_team_id  :integer
#

class Match < ApplicationRecord
  belongs_to :visit_team, :class_name => 'Team', foreign_key: "visit_team_id"
  belongs_to :home_team, :class_name => 'Team', foreign_key: "home_team_id"
  belongs_to :tournament
  has_many :pictures

end
