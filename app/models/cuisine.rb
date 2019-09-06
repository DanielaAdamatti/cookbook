class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: "Você deve informar o nome da Cozinha" }
  validates :name, uniqueness: { case_sensitive: false, message: "Cozinha já cadastrada"  }
end
