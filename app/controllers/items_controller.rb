class ItemsController < ApplicationController
  def index
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.new
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.new(item_params)
    if @item.save
      flash[:success] = "Added to-do list item."
      redirect_to todo_list_items_path
    else
      flash[:error] = "There was a problem adding that item"
      render action: :new
    end
  end

  private
  def item_params
    params[:item].permit(:content)
  end
end
