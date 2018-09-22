require 'date'

class TasksController < ApplicationController
  # TASKS = ["Water chia head", "Pet fuzzy rock", "Hug teddy", "Smell some flowers", "Paint the plates", "Pop water ballon"]

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
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date],
      completed: false
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
    redirect_to tasks_path(@task)
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to root_path
  end

end
