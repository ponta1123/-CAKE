class Public::ItemsController < ApplicationController

  def index
    if params[:genre_seach]
      @genre = Genre.find(params[:genre_seach])
      @items = @genre.items
    else
     @items = Item.all
    end
   @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = CartItem.new
    @genres = Genre.all
  end

 private

 def item_params
   params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
 end
end
