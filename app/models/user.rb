class User < ActiveRecord::Base
  #Class Methods
  def self.roles
    %w(basic premium diagnostic admin)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #Validations
  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :role, inclusion: { in: self.roles,
            message: "%{value} is not a valid role" }
  validates :email, presence: true, uniqueness: true

  #Instance Methods
  def full_name
    "#{first_name} #{last_name}"
  end


end
