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
end
