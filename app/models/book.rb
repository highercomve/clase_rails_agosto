class Book < ActiveRecord::Base

  has_many :comments, dependent: :destroy

   validates :title, :author, presence: :true

   validates :price, numericality: { greater_than: 0, message: "Debe ser mayor a 0" } 
end
