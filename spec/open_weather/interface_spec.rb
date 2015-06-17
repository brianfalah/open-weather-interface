require 'spec_helper'
require 'open_weather/interface.rb'

describe OpenWeather::Interface do
	it 'has a version number' do
		expect(OpenWeather::VERSION).not_to be nil
	end

	it 'by_city_name response ok' do
		response = OpenWeather::Interface.by_city_name('Buenos Aires')
		expect(response['cod']).to eq(200)
		if response['cod'] == 200
			expect(response['name']).to eq('Buenos Aires')
			expect(response['sys']['country']).to eq('AR')
		end
	end

	it 'by_city_name with country code response ok' do
		response = OpenWeather::Interface.by_city_name('Santiago Del Estero', {country_code: 'AR'})
		expect(response['cod']).to eq(200)
		if response['cod'] == 200
			expect(response['name']).to eq('Santiago del Estero')
			expect(response['sys']['country']).to eq('AR')
		end
	end

	it 'by_city_id response ok' do
		response = OpenWeather::Interface.by_city_id(3435910)
		expect(response['cod']).to eq(200)
		if response['cod'] == 200
			expect(response['name']).to eq('Buenos Aires')
			expect(response['sys']['country']).to eq('AR')
		end
	end

	it 'by_lat_lon response ok' do
		response = OpenWeather::Interface.by_lat_lon(-34.62, -58.38)
		expect(response['cod']).to eq(200)
		if response['cod'] == 200
			expect(response['name']).to eq('Buenos Aires')
			expect(response['sys']['country']).to eq('AR')
		end
	end

	it 'by_lat_lon with more precision response ok' do
		response = OpenWeather::Interface.by_lat_lon(-34.62854556, -58.38123456)
		expect(response['cod']).to eq(200)
		if response['cod'] == 200
			expect(response['name']).to eq('Barracas')
			expect(response['sys']['country']).to eq('AR')
		end
	end
	
	# it 'by_zip response ok (API NOT WORKING PROPERLY' do
	# 	response = OpenWeather::Interface.by_zip(94040, 'us')
	# 	expect(response['cod']).to eq(200)
	# 	if response['cod'] == 200
	# 		expect(response['name']).to eq('Mountain View')
	# 		expect(response['sys']['country']).to eq('US')
	# 	end
	# end

end
