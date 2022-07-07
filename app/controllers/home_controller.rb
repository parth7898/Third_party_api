class HomeController < ApplicationController
  require 'rest-client'

  def index

    @result = Coin.limit(5) 
  end

  def fetch_data

    begin
      result = Coin.where('coin_id = ? or name = ?', params[:query], params[:query])
      
      if result.present?
        coin_id = result.first.coin_id
        url = "#{coin_id}/market_chart?vs_currency=usd&days=14&interval=daily"
        @result = CoinsApiService.new(url).call
      else
        url = "#{search(params[:query])}/market_chart?vs_currency=usd&days=14&interval=daily"
        @result = CoinsApiService.new(url).call
      end
    rescue => e
      @result = []
    end    
  end

  private

  def search(name)
    url = "/list"
    coin_list = CoinsApiService.new(url).call
    coin_list.detect { |f| f["name"] == name || f["id"] == name }["id"]
  end
end
