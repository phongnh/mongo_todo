class ListsController < ApplicationController
  before_filter :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new params[:list]
    if @list.save
      redirect_to lists_path, :notice => 'List was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, :notice => 'List was successfully destroyed.'
  end

  def edit
    render :edit
  end

  def update
    if @list.update_attributes(params[:list])
      redirect_to lists_path, :notice => 'List was successfully updated.'
    else
      render :edit
    end
  end

  alias :show :edit

  private

    def find_list
      @list = List.find params[:id]
    end
end