class ItemsController < ApplicationController

  before_action :check_admin, :only => [:edit, :update, :create, :new, :add]

  def index
  	@items = Item.where(hidden: nil)
  end

  def show
  	@item = Item.find(params[:id])
    @categories = Category.all
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to @item
  	else
  		render 'new'
  	end		
  end

  def new
  	@item = Item.new
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  		@item = Item.find(params[:id])
 		if @item.update(item_params)
    		redirect_to @item
  		else
    		render 'edit'
  		end
	end	

  def add
    @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])
    @item.categories << @category
    redirect_to categories_path  
  end


  private 
  	def item_params
  		params.require(:item).permit(:title, :description, :price, :hidden)
  	end		
end
