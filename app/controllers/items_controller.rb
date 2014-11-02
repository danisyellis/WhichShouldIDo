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
      flash[:success] = "Added to-do list item"
      redirect_to todo_list_items_path
    else
      flash[:error] = "There was a problem adding that item"
      render action: :new
    end
  end

  def edit
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Saved todo list item"
      redirect_to todo_list_items_path
    else
      flash[:error] = "There was a problem saving that item"
      render action: :edit
    end
  end

  private
  def item_params
    params[:item].permit(:content)
  end
end
