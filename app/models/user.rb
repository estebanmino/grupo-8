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

class User < ApplicationRecord
  has_secure_password

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 },
                     confirmation: true, allow_blank: false
  validates :position, presence: true

  has_many :posts


  has_many :performances
  has_many :matches, through: :performances

  belongs_to :team

  #has_many :invitations, :class_name => "Invitation", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invitation", :foreign_key => 'sender_id'

  def full_name
    "#{name} #{last_name}"
  end

end
