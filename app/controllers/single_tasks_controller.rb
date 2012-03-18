class SingleTasksController < ApplicationController
  before_filter :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.includes(:list).all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new params[:task]

    if @task.save
      redirect_to tasks_path, :notice => 'Task was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, :notice => 'Task was successfully destroyed.'
  end

  def edit
    render :edit
  end

  def update

    if @task.update_attributes(params[:task])
      redirect_to tasks_path, :notice => 'Task was successfully updated.'
    else
      render :edit
    end
  end

  alias :show :edit

  private

    def find_task
      @task = Task.find params[:id]
    end
end