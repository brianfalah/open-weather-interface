require 'spec_helper'
require 'open_weather/interface.rb'

describe OpenWeather::Interface do
	it 'has a version number' do
		expect(OpenWeather::VERSION).not_to be nil
	end

	it 'city response ok' do
		response = OpenWeather::Interface.by_city_name('Buenos Aires')
		expect(response['cod']).to eq(200)
	end

	it 'city with country code response ok' do
		response = OpenWeather::Interface.by_city_name('Buenos Aires', country_code: 'AR')
		expect(response['cod']).to eq(200)
	end
end
