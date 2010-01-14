class JobsController < ApplicationController
  layout 'layout'
  
  def index
    @current = "jobs"
    @jobs = Job.find(:all, :order=>"created_at DESC")
    if params[:id]
      @job = Job.find(params[:id])
      @tasks = @job.tasks
    end
  end
  
  def tasks
    @job = Job.find(params[:id])
    @tasks = @job.tasks
  end
  
  def task_create 
    @task = Task.create(params[:task])
    @task.status_flag = "open"
    @task.save
    job = Job.find(params[:job_id])
    job.tasks << @task
  end
  
  def task_update
    @task = Task.find(params[:id])
    if @task.status_flag == "open"
      @task.status_flag = "completed"
    else 
      @task.status_flag = "open"
    end
    @task.save
  end

  def task_delete
    @task = Task.find(params[:id])
    @task.delete
  end
  
  def new
    render :action=>"new", :layout=>"popup"
  end
  
  def create
    j = Job.create(params[:jobs])
    client = Client.find(params[:client][:id])
    j.client = client
    j.save
    
    if params[:estimate]
      e = Estimate.create(params[:estimate])
      j.estimate = e
      j.save
    end
  end
  
  def delete
    j = Job.find(params[:id])
    j.delete
    redirect_to :action=>"index"
  end
  
  def edit
    @job = Job.find(params[:id])
    @estimate = @job.estimate unless @job.estimate.nil?
    render :action=>"edit", :layout=>"popup"
  end
  
  def update
    @job = Job.find(params[:job][:id])
    @job.update_attributes!(params[:job])
    if params[:estimate]
      @estimate = Estimate.find(params[:estimate][:id])
      @estimate.update_attributes!(params[:estimate])
    end
  end
  
  def print_estimate
    @estimate = Job.find(params[:id]).estimate
    prawnto :inline => false, :filename => @estimate.title+".pdf"
  end
  
end
