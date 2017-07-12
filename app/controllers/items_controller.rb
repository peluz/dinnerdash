class ItemsController < ApplicationController
  before_action :check_admin, :only => [:edit, :destroy, :update, :create, :new]
  def index
  	@items = Item.all	
  end

  def show
  	@item = Item.find(params[:id])
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
  private 
  	def item_params
  		params.require(:item).permit(:title, :description, :price)
  	end		
end
