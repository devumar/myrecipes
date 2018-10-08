class RecipesController < ApplicationController
	before_action :set_recipe, only:[:show, :update, :destroy, :edit]
	def index
		@recipes = Recipe.all		
	end
	def show
 
 	end
	def new
		@recipe = Recipe.new
	end
	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.chef = Chef.first
		@recipe.save
		if @recipe.save
			flash[:success] = "Recipe is created successfully"
			redirect_to recipe_path(@recipe)
		else
			render 'new'
		end	
	end
	def edit
	end
	def update
		if @recipe.update(recipe_params)
			flash[:success] = "Recipe is Updated successfully"
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end
	def destroy
		@recipe.destroy
		flash[:success] ="Recipe Deleted successfully"
		redirect_to recipes_path
	end
	private
		def set_recipe
			@recipe = Recipe.find(params[:id])
		end
		def recipe_params
			params.require(:recipe).permit(:name, :description)
		end
end	