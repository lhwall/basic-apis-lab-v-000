class RepositoriesController < ApplicationController

  def search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    # req.params['client_id'] = clientID
    # req.params['client_secret'] = clientSecret
    req.params['q'] = "tetris"
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["response"]["repositories"]
    else
      @error = body["meta"]["errorDetail"]
    end

  end
  render 'search'
  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        # req.params['client_id'] = b1bb3f1be65d525b319c
        # req.params['client_secret'] = 2b4748113a55766f2ff7bdae9b6cfc8b190feaff
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["response"]["repositories"]
    else
      @error = body["meta"]["errorDetail"]
    end


  end
  render 'search'
  end

end
