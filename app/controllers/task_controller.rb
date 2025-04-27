class TaskController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]

  def index
    @tasks = current_user.tasks.where(completed: false)
    @completed_tasks = current_user.tasks.where(completed: true)
    @total_points = current_user.tasks.where(completed: true).sum(:points)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def toggle
    @task.update(completed: !@task.completed)
    redirect_to tasks_path
  end

  private

  def set_task
    @task.destroy
    redirect_to tasks_path
  end

  def task_params
    params.require(:task).permit(:name, :points, :due_date, :repeat_days)
  end
end