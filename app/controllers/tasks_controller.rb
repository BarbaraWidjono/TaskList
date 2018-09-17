class TasksController < ApplicationController
  TASKS = ["Water chia head", "Pet fuzzy rock", "Hug teddy", "Smell some flowers", "Paint the plates", "Pop water ballon"]

  def index
    @tasks = TASKS
  end

  def show
    task_id = params[:id].to_i
    @task = TASKS[task_id]

    if @task.nil?
      head 404
    end
  end
end
