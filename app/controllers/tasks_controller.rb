class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:sort_expired]
      @tasks = current_user.tasks.all.order('deadline DESC').page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.all.order('priority ASC').page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.all.page(params[:page]).per(5)
    end

    if params[:search].present?
      if params[:search][:title].present? && params[:search][:status].present?
        @tasks = current_user.tasks.where('title LIKE ?', "%#{params[:search][:title]}%").where(status: params[:search][:status]).page(params[:page]).per(5)
      elsif params[:search][:title].present?
        @tasks = current_user.tasks.where('title LIKE ?', "%#{params[:search][:title]}%").page(params[:page]).per(5)
      elsif params[:search][:status].present?
        @tasks = current_user.tasks.where(status: params[:search][:status]).page(params[:page]).per(5)
      end
    end
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def show
  end

  def new 
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    params.require(:task).permit(:title, :content, :deadline, :status, :priority, { label_ids: [] })
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
