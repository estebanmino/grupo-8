# == Schema Information
#
# Table name: tournaments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  season      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  division_id :integer
#

require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
