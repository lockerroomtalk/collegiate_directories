require "collegiate_directories/version"

require "json"
require "httparty"

# Public: Interact with the Collegiate Directories API.
class CollegiateDirectories
  include HTTParty

  class ApiError < StandardError; end
  class SportNotFound < StandardError; end

  base_uri "https://www.collegiatedirectories.com/data/api"
  format   :json
  headers  "Content-Type" => "application/json"

  # Public: Check a response for validity.
  #
  # response - Object representing the response.
  #
  # Raises ApiError on error.
  CHECK_RESPONSE = lambda do |response|
    begin
      response.fetch("ResultCode").nonzero? &&
        raise(ApiError, response["Message"])
    rescue KeyError, NoMethodError
      raise ApiError, "Incomplete response"
    end
  end

  # Public: Initialize the API client.
  #
  # token - A String containing the API token (default:
  #         COLLEGIATE_DIRECTORIES_TOKEN environment variable).
  def initialize(token: ENV["COLLEGIATE_DIRECTORIES_TOKEN"])
    @default_opts = { body: token.to_json }
  end

  # Public: Return the coaches for a specific sport.
  #
  # sport - The Integer ID of the sport or the String name of the sport.
  #
  # Returns Hash.
  # Raises CollegiateDirectories::ApiError on error.
  def coaches_for(sport)
    sport = sport_to_api(sport)

    response = self.class.post("/Coaches?sportId=#{sport}", @default_opts)
    response.parsed_response.tap(&CHECK_RESPONSE)
  end

  # Public: Return the sports the directory supports.
  #
  # Returns Hash.
  # Raises CollegiateDirectories::ApiError on error.
  def sports
    response = self.class.post("/Sports", @default_opts)
    response.parsed_response.tap(&CHECK_RESPONSE)
  end

  private

  # Private: Convert a String representation of a sport to the correct Integer
  # ID.
  #
  # sport - The Integer ID of the sport or the String name of the sport.
  #
  # Returns Integer.
  # Raises CollegiateDirectories::SportNotFound on error.
  def sport_to_api(sport)
    return sport if sport.is_a?(Integer)

    found = sports["Sports"].find { |o| o["Name"].casecmp(sport.to_s).zero? }
    raise SportNotFound, "#{sport} is an invalid sport" if found.nil?

    found["Id"]
  end
end
