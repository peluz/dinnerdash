class ItemsController < ApplicationController
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
  private 
  	def item_params
  		params.require(:item).permit(:title, :description, :price)
  	end		
end
