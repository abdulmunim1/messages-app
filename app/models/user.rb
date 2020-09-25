class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :name, :email, :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages

  scope :valid_receivers, -> { where.not(token: nil)}

  def self.get_registration_tokens_except user
    User.valid_receivers.where.not(id: user.id).pluck(:token)
  end
end
