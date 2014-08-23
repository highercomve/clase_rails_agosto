class User < ActiveRecord::Base

  has_one :profile
  has_many :comments

  def full_name
      [name, last_name].join(" ")
  end  

  def age
    (Date.today - birthday).to_i / 365
  end
end