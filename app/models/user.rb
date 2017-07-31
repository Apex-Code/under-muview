class User < ApplicationRecord
  has_many :reviews	
  has_many :movies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login

end
