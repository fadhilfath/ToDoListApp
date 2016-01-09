class ItemsController < ApplicationController
    
    def index
       @item = Item.new
       @all_items = Item.order(created_at: :desc).all
    end
    
    def new
       @item = Item.new 
    end
    
    def show 
       @all_items = Item.all 
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
           flash[:success] = "You have successfully added item!"    
           redirect_to root_path
        else
           render 'new' 
        end
    end
    
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        flash[:danger] = "Item was successfully deleted"
        redirect_to root_path
    end
    
    
    private
    def item_params
       params.require(:item).permit(:item) 
    end
    
end