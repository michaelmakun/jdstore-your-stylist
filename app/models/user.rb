class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def stylist?
    is_stylist
  end

  has_many :orders
  mount_uploader :image, ImageUploader

  has_many :products
end
