class List < ApplicationRecord
  validates :name, presence: { message: "O nome da lista deve ser informado" }
  belongs_to :user
end
