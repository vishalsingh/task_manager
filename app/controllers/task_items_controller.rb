class TaskItemsController < ApplicationController
  
  before_filter :authenticate_user! 
  
  # GET /task_items
  # GET /task_items.xml
  def index
    @task_items = current_user.tasks
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @task_items }
    end
  end

  # GET /task_items/1
  # GET /task_items/1.xml
  def show
    @task_item = TaskItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task_item }
    end
  end

  # GET /task_items/new
  # GET /task_items/new.xml
  def new
    @task_item = TaskItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task_item }
    end
  end

  # GET /task_items/1/edit
  def edit
    @task_item = TaskItem.find(params[:id])
  end

  # POST /task_items
  # POST /task_items.xml
  def create
    @task_item = TaskItem.new(params[:task_item])

    respond_to do |format|
      if @task_item.save
        format.html { redirect_to(@task_item, :notice => 'Task item was successfully created.') }
        format.xml  { render :xml => @task_item, :status => :created, :location => @task_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /task_items/1
  # PUT /task_items/1.xml
  def update
    @task_item = TaskItem.find(params[:id])

    respond_to do |format|
      if @task_item.update_attributes(params[:task_item])
        format.html { redirect_to(@task_item, :notice => 'Task item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /task_items/1
  # DELETE /task_items/1.xml
  def destroy
    @task_item = TaskItem.find(params[:id])
    @task_item.destroy

    respond_to do |format|
      format.html { redirect_to(task_items_url) }
      format.xml  { head :ok }
    end
  end
end
