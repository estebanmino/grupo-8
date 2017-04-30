# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  last_name       :string
#  email           :string
#  password        :string
#  position        :string
#  is_admin        :boolean
#  is_captain      :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  team_id         :integer
#  tournament_id   :integer
#  division_id     :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
