class TasksController < ApplicationController
  before_filter :find_list
  before_filter :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @list.tasks.all
  end

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new params[:task]

    set_due_field

    if @task.save
      redirect_to list_tasks_path(@list), :notice => 'Task was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list), :notice => 'Task was successfully destroyed.'
  end

  def edit
    render :edit
  end

  def update

    set_due_field

    if @task.update_attributes(params[:task])
      redirect_to list_tasks_path(@list), :notice => 'Task was successfully updated.'
    else
      render :edit
    end
  end

  alias :show :edit

  private

    def set_due_field
      @task.due = Date.new(
        params[:task]['due(1i)'].to_i,
        params[:task]['due(2i)'].to_i,
        params[:task]['due(3i)'].to_i
      )
    end

    def find_list
      @list = List.find params[:list_id]
    end

    def find_task
      @task = @list.tasks.find params[:id]
    end
end