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
#  tournament_id :integer
#

class Match < ApplicationRecord

  validates :date, presence: true, allow_blank: false
  validates :time, presence: true, allow_blank: false
  validates :visit_team, presence: true, allow_blank: false
  validates :home_team, presence: true, allow_blank: false
  validates :tournament_id, presence: true, allow_blank: false
  validates :visitor_goals, :numericality => { :greater_than_or_equal_to => 0 }
  validates :local_goals, :numericality => { :greater_than_or_equal_to => 0 }
  validates :played, inclusion: { in: [ true, false ] }

  validates :place, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :commune, presence: true, allow_blank: false

  belongs_to :visit_team, :class_name => 'Team', foreign_key: "visit_team_id"
  belongs_to :home_team, :class_name => 'Team', foreign_key: "home_team_id"
  belongs_to :tournament
  has_many :pictures

  has_many :performances
  has_many :users, through: :performances

  geocoded_by :location
  after_validation :geocode

  def winner
    if played
      if visitor_goals > local_goals
        return visit_team
      elsif local_goals > visitor_goals
        return home_team
      end
    end
    nil
  end

  def complete_date
    "#{date.to_s} #{time.to_s[11,8]}"
  end

  def location
    "#{address}, #{commune}, Chile"
  end


end
