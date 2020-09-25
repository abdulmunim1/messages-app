class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :name, :email, :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :messages
  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :name, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ , message: "Email invalid"  }
  validates :password, length: { minimum:6 }
  scope :valid_receivers, -> { where.not(token: nil)}

  def self.get_registration_tokens_except user
    User.valid_receivers.where.not(id: user.id).pluck(:token)
  end

  def save_token token
    self.token =  token
    save validate: false
  end
end
