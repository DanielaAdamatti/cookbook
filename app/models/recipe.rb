class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :user
  belongs_to :cuisine
  has_one_attached :recipe_image
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients,
            :cook_method, presence: true


  def cook_time_min
    "#{cook_time} minutos"
  end
end
