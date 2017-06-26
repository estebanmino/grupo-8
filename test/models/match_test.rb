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

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
