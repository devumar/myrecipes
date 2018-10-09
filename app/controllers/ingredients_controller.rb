class IngredientsController < ApplicationController

	before_action :set_ingredient, only: [:show, :update, :edit]
	before_action :require_admin, except: [:show, :index]

	def show
		@ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			flash[:success] = "Ingredient Was successfully created"
			redirect_to ingredient_path(@ingredient)
		else
			render 'new'
		end	
	end

	def update
		if @ingredient.update(ingredient_params)
			flash[:success] = "Ingredient Name was updated successfully"
			redirect_to ingredient_path(@ingredient)
		else
			render 'edit'
		end		
	end

	def edit
		
	end

	def index
		@ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
	end

	private

	def require_admin
		if  !logged_in? || (!current_chef.admin? and logged_in?) 
			flash[:danger] = "You are not allowd to perform this action"
			redirect_to ingredients_path
		end
	end

	def ingredient_params
		params.require(:ingredient).permit(:name)
	end

	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
	end
end	