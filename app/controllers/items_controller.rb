class ItemsController < ApplicationController
  before_action :find_todo_list

  def index

  end

  def new
    @item = @todo_list.items.new
  end

  def create
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
    @item = @todo_list.items.find(params[:id])
  end

  def update
    @item = @todo_list.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "To-do list item has been updated"
      redirect_to todo_list_items_path
    else
      flash[:error] = "There was a problem saving that item"
      render action: :edit
    end
  end

  def destroy
    @item = @todo_list.items.find(params[:id])
    @item.destroy
    redirect_to todo_list_items_path
  end


  private

  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def item_params
    params[:item].permit(:content)
  end
end
