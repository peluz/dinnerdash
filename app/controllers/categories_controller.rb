class CategoriesController < ApplicationController
  before_action :check_admin, :only => [:edit, :destroy, :update, :create, :new]
  def index
  	@categories = Category.all	
  end

  def show
	@category = Category.find(params[:id])
  @items = @category.items.where(hidden: nil)
  end

  def create
  	@categories = Category.new(categories_params)
  	if @categories.save
  		redirect_to @categories
  	else
  		render 'new'
  	end		
  end

  def new
  	@categories = Category.new
  end

  private
  	def categories_params
  		params.require(:category).permit(:title)
  	end	
end
