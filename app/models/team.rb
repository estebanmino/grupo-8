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
  validates :gf, :numericality => { :greater_than_or_equal_to => 0 }
  validates :ga, :numericality => { :greater_than_or_equal_to => 0 }

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  has_many :visit_matches, :class_name => 'Match', :foreign_key => 'visit_team_id'
  has_many :home_matches, :class_name => 'Match', :foreign_key => 'home_team_id'

  belongs_to :division
  has_and_belongs_to_many :tournaments

  has_many :users


  has_many :invitations


  def update_stats
    stats = {points: 0, gc: 0, gf: 0, pj: 0, pe: 0, pg: 0}
    home_tournament_matches = self.home_matches.collect{|match| match if match!= nil  && !match.tournament.playoff && match.played}.compact
    visit_tournament_matches = self.visit_matches.collect{|match| match if match!= nil  && !match.tournament.playoff && match.played}.compact

    p home_tournament_matches
    p visit_tournament_matches

    stats[:pj] = home_tournament_matches.size +
                visit_tournament_matches.size

    if (stats[:pj] != 0)
      for match in home_tournament_matches
        if match.local_goals > match.visitor_goals
          stats[:points] += 3
          stats[:gc] += match.visitor_goals
          stats[:gf] += match.local_goals
          stats[:pg] += 1
        elsif match.local_goals == match.visitor_goals
          stats[:points] += 1
          stats[:pe] += 1
          stats[:gc] += match.visitor_goals
          stats[:gf] += match.local_goals
        else
          stats[:gc] += match.visitor_goals
          stats[:gf] += match.local_goals
        end
      end

      for match in visit_tournament_matches
        if match.local_goals < match.visitor_goals
          stats[:points] += 3
          stats[:gf] += match.visitor_goals
          stats[:gc] += match.local_goals
          stats[:pg] += 1
        elsif match.local_goals == match.visitor_goals
          stats[:points] += 1
          stats[:pe] += 1
          stats[:gf] += match.visitor_goals
          stats[:gc] += match.local_goals
        else
          stats[:gf] += match.visitor_goals
          stats[:gc] += match.local_goals

        end
      end
    end
    self.gf = stats[:gf]
    self.ga = stats[:gc]
    self.won = stats[:pg]
    self.lost = stats[:pj] - stats[:pg] - stats[:pe]
    self.tie = stats[:pe]
    self.points = stats[:points]
    self.save
    stats
  end
end
