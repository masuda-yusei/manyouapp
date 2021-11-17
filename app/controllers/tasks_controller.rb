class TasksController < ApplicationController

  def index
    @tasks = Task.all
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













end
