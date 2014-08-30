class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :comments
  
  has_and_belongs_to_many :books

  # before_save :upcase_all
  accepts_nested_attributes_for :profile
  
  def full_name
      [name, last_name].join(" ")
  end  

  def age
    (Date.today - birthday).to_i / 365
  end

  private

  def upcase_all
    name.upcase!
    last_name.upcase!
  end
end