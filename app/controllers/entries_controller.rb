class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.create(entry_params)
    redirect_to "/entries"
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :name, :length, :state, :city, :notes,
                                  :lat, :lon, :user_id)
  end
end
