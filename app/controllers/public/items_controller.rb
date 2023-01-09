class Public::ItemsController < ApplicationController

  def index
    if params[:genre_seach]
      @genre = Genre.find(params[:genre_seach])
      @items = @genre.items.page(params[:page])
    else
     @items = Item.page(params[:page])
    end
   @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = CartItem.new
    if params[:genre_seach]
     @genre = Genre.find(params[:genre_seach])
     @items = @genre.items.page(params[:page])
     redirect_to items_path
    else
     @genres = Genre.all
    end
  end

 private

 def item_params
   params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
 end
end
