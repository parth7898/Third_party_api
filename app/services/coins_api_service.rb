class CoinsApiService

  def initialize(url)  
    @url = base_url + url
  end

  def call
    get_data
  end

  private

  def base_url
    "https://api.coingecko.com/api/v3/coins/"
  end

  def get_data
    response = RestClient.get(@url)
    JSON.parse(response)
  end
end