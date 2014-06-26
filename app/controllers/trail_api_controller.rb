class TrailApiController < ApplicationController
  def index
  end

  def new
    @trail_api = TrailApi.new(trail_api_params)
  end

  def select
    @items = TrailApi.for_state(params["trail_api"]["state"])
    Rails.logger.debug "USA!!! #{@items}"
    @trail_entries = @items["places"].collect do |item|
      Entry.new(:name => item["name"], :length => item["activities"][0]["length"],
                :state => item["state"], :city => item["city"])
    end
  end
end
