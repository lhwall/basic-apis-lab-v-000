class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # req.params['client_id'] = clientID
      # req.params['client_secret'] = clientSecret
      req.params['q'] = "tetris"
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
# byebug
      @repositories = @resp.body["response"]
    else
      @error = body["meta"]["errorDetail"]
    end


  end
  render 'search'
  end

end
