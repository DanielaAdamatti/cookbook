class List < ApplicationRecord
  validates :name, presence: { message: "O nome da lista deve ser informado" }
end
