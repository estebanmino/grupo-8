# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string
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

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
