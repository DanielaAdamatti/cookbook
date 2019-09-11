class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    @list.user = current_user

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
