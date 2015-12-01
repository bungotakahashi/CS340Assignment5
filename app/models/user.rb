class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :apartment_data, :dependent => :delete_all
  has_many :other_properties, :dependent => :delete_all
  attr_accessor :login
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]
  #validates_uniqueness_of :username
  #validates_presence_of :username
  validates :username,
  :presence => true,
  :uniqueness => {
  :case_sensitive => false
  } # etc.
  # user_idを使用してログインするようオーバーライド
def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  # 登録時にemailを不要とする
  #def email_required?
   # false
  #end 

  #def email_changed?
  #  false
  #end 


end
