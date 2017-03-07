class TasksController < ApplicationController
  def index         # GET /tasks
    @tasks = Task.all
  end

  def show          # GET /tasks/:id
    @task = Task.find(params[:id])
  end

  def new           # GET /tasks/new
    @task = Task.new
    # redirect_to tasks_path
  end

  def create        # POST /tasks
    # raise
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit          # GET /tasks/:id/edit
    @task = Task.find(params[:id])
  end

  def update        # PATCH /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy       # DELETE /tasks/:id
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title)
  end
end

