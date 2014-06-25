class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new(entry_params)
    @entry.attachments.build
  end

  def create
    @entry = current_user.entries.create(entry_params)
    redirect_to entries_path
  end

  def edit
    @entry = Entry.find(params[:id])
    if @entry.attachments
      @entry.attachments.build
    end
  end

  def update
    @entry = Entry.find_by_id(params[:id])
    @entry.update(entry_params)
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :name, :length, :state, :city, :notes,
                                  :lat, :lon, :user_id, attachments_attributes: [:attachment])
  end
end
