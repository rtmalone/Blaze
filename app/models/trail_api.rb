class TrailApi
  include HTTParty
  base_uri 'https://outdoor-data-api.herokuapp.com'
  default_params api_key: ENV["TRAIL_API_KEY"]

  def initialize
  end

  def for_state(state)
    @options = {query: { q:{activities_activity_type_name_cont: "hiking", state_eq: state} }}
    self.class.get("/api.json", @options)
  end
end
