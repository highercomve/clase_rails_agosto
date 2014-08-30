class Book < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  
  has_and_belongs_to_many :users
  
  validates :title, :author, presence: :true

  validates :price, numericality: { greater_than: 0, message: "Debe ser mayor a 0" } 

  # accepts_nested_attributes_for :comments 

# { book: 
#   { 
#     title: "Mi titulo", 
#     author: "Pedro Perez", 
#     price: "100", 
#     pages: "100", 
#     language: "English",
#     comments_attributes: [
#       { user_id: "3", 
#         review: "Burda de bueno ese libro menol!!" 
#       }
#     ] 
#   } 
# }
end
