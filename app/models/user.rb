class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #=========================== Validations =============================

  validates :email, presence: true, uniqueness: true

  #=========================== Associations =============================

  has_many :reviews, dependent: :destroy
end
