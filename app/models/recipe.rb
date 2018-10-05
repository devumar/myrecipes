class Recipe < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true lenght: {minimum: 5, maximum: 500 }
end	