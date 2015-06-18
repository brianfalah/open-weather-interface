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
	
	# it 'by_zip response ok (not included in standard package)' do
	# 	response = OpenWeather::Interface.by_zip(94040, 'us')
	# 	expect(response['cod']).to eq(200)
	# 	if response['cod'] == 200
	# 		expect(response['name']).to eq('Mountain View')
	# 		expect(response['sys']['country']).to eq('US')
	# 	end
	# end

	it 'with units option ok' do
		response = OpenWeather::Interface.by_city_id(3435910, {units: 'metric'})
		expect(response['cod']).to eq(200)						
	end

	it 'with lang option ok' do
		response = OpenWeather::Interface.by_city_id(3435910, {lang: 'es'})
		expect(response['cod']).to eq(200)						
	end

	it 'by_city_name not existing' do
		response = OpenWeather::Interface.by_city_name('NOT EXISTING CITY')
		expect(response['cod']).to eq(404)		
	end

	it 'with units option fail' do
		response = OpenWeather::Interface.by_city_id(3435910, {units: 'metrical'})
		expect(response['cod']).to eq(404)
		expect(response['message']).to eq("metrical is not a valid unit")		
	end

	it 'with lang option fail' do
		response = OpenWeather::Interface.by_city_id(3435910, {lang: 'spanish'})
		expect(response['cod']).to eq(404)
		expect(response['message']).to eq("spanish is not a valid language")	
	end

	it 'not permitted parameter' do
		response = OpenWeather::Interface.by_city_name('Santa Fe', {language: 'sp'})
		expect(response['cod']).to eq(404)
		expect(response['message']).to eq("parameter language is not permitted")	
	end

end
