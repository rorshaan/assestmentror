class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    tasks = Task.all
    success_response(tasks)
  end

  def show
    success_response(@task)
  end

  def create
    task = Task.new(task_params)
    if task.save
      success_response(task, :created)
    else
      failuar_response(task.errors.full_messages)
    end
  end

  def update
    if @task.update(task_params)
      success_response(@task)
    else
      failuar_response(@task.errors.full_messages)
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue => err
    failuar_response(['Task Not Found'])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def success_response(data, status = :ok)
    render json: { data: data }, status: status
  end

  def failuar_response(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end
end
