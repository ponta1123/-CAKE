class Public::HomesController < ApplicationController
  def top
    @items = Item.order('id DESC').limit(4)
    if params[:genre_seach]
      @genre = Genre.find(params[:genre_seach])
      @items = @genre.items.order('id DESC').limit(4)
    else
    @genres = Genre.all
    end
  end
end
