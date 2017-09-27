class EntriesController < ApplicationController
  respond_to :json
  
  def index
    respond_with Entry.all
  end
  
  def show
    respond_with Entry.find(params[:id])
  end
  
  def create
    respond_with Entry.create(entry_params)
  end
  
  def update

    @e= Entry.find(params[:id])
    respond_with @e.update(entry_params)
  end

  def destroy
    @e= Entry.find(params[:id])
    respond_with @e.destroy()
  end
  private

    def entry_params
      params.require(:entry).permit(:ename, :complete,:starttime, :endtime)
    end


end
