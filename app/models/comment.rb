class Comment < ApplicationRecord
	validates :description, presence: true, length: {minimum: 3, maximum: 40}
	belongs_to :chef
	belongs_to :recipe
	validates :chef_id, presence: true
	validates :recipe_id, presence: true
	default_scope -> {order(updated_at: :desc)}
end
