class ListsController < ApplicationController
  before_action :load_lists, only: [:index, :create]

  def index
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @allmovies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # use this to redirect to new list instead of stay on same page
      # redirect_to list_path(@list)
      redirect_to lists_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def load_lists
    @lists = List.all
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
