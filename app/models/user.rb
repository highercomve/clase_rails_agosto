class User < ActiveRecord::Base

  has_one :profile
  has_many :comments

  before_save :upcase_all

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