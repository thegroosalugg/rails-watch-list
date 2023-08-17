# piss off rubocop
class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new(bookmark_params)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @list.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
