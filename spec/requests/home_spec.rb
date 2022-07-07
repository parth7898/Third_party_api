require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    let!(:coin){ FactoryBot.create_list(:coin,5)}

    it 'returns coins list  data' do 
      get '/'
      expect(coin.size).to eq(5)
    end
  end

  describe "GET/ fetch_data" do
    let!(:coin){ FactoryBot.create_list(:coin,5)}
    
    it 'Show 14 days data' do 
      get '/coin-data', params: { query: "01coin" }
      expect(response.code).to eq("200")
    end

    it 'Add new coin' do 
      get '/coin-data', params: { query: "bitcoin" }
      expect(response.code).to eq("200")
    end
  end
end
