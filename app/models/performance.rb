# == Schema Information
#
# Table name: performances
#
#  id           :integer          not null, primary key
#  goals        :integer          not null
#  yellow_cards :integer          not null
#  red_cards    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  match_id     :integer
#  user_id      :integer
#

class Performance < ApplicationRecord

  belongs_to :user
  belongs_to :match

end
