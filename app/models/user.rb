class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  def admin? 
    false 
  end

  def ability 
    @ability ||= Ability.new(Self)
  end 
  delegate :can?, :cannot?, :to => :ability

  def self?
    self.admin 
  end

  def has_role?(role)
    roles.include?(role)
  end

  has_many :posts,    dependent: :destroy
  has_many :comments

  has_many :likes 
  has_many :liked_posts, through: :likes, source: :post

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
