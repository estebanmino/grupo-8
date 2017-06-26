# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  date               :date             not null
#  comment            :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  match_id           :integer
#

require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
