class List < ApplicationRecord
  validates :name, presence: { message: "O nome da lista deve ser informado" }
  validates :name, uniqueness: { scope: :user,  message: "Lista já existe" }
  belongs_to :user
end
