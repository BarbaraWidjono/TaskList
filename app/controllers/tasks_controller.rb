require 'date'

class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head 404
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      task_params
    )

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def completed
    today_date = Date.today
    @task = Task.find(params[:id])

    @task.update(completed: true, date_completed: today_date)
    redirect_to root_path
  end

  def update
    @task = Task.find(params[:id])

    @task.update(action: params[:task][:action], description: params[:task][:description], completion_date: params[:task][:completion_date])
    redirect_to task_path(@task)
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to root_path
  end

  private
  def task_params
    return params.require(:task).permit(
      :action,
      :description,
      :completion_date
    )
  end

end
