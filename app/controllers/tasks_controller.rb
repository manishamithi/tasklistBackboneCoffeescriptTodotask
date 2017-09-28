class TasksController < ApplicationController
  respond_to :json
  
  def index
    respond_with Task.all
  end
  
  def show
    respond_with Task.find(params[:id])
  end
  
  def create
    respond_with Task.create(entry_params)
  end
  
  def update
    @element = Task.find(params[:id])
    respond_with @element.update(entry_params)
  end

  def destroy
    @e= Task.find(params[:id])
    respond_with @e.destroy()
  end

  private

    def entry_params
      params.require(:task).permit(:listname, :startdate, :enddate,:complete)
    end

end
