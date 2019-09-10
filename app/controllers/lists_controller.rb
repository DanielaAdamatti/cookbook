class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))

    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end
end
