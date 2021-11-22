class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:sort_expired]
      @tasks = Task.all.order('deadline DESC').page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = Task.all.order('priority ASC').page(params[:page]).per(5)
    else
      @tasks = Task.all.page(params[:page]).per(5)
    end

    if params[:search].present?
        @tasks = Task.where('title LIKE ?', "%#{params[:search][:title]}%").where(status: params[:search][:status]).page(params[:page]).per(5)
      elsif params[:search][:title].present?
        @tasks = Task.where('title LIKE ?', "%#{params[:search][:title]}%").page(params[:page]).per(5)
      elsif params[:search][:status].present?
        @tasks = Task.where(status: params[:search][:status]).page(params[:page]).per(5)
      end
    end
  end

  def show
  end

  def new 
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task was successfully created!"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"Task was successfully deleted!"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
