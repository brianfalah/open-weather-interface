# open-weather-interface

This is an interface for getting the current weather data interacting with the openweathermap API (http://openweathermap.org/current).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open-weather-interface'
```

And then execute:

    $ bundle

Or install it yourself as:
		
    $ gem install open-weather-interface

## Usage

Call current weather data for one location

You can choose these search methods:

By city name
By city ID
By geographic coordinates

## By city name
Calls by city name. API respond with a list of results that match a searching word, execute:

		response = OpenWeather::Interface.by_city_name('Buenos Aires')

Calls by city name with country code
		
		response = OpenWeather::Interface.by_city_name('Santiago Del Estero', {country_code: 'AR'})

## By city ID
	
		response = OpenWeather::Interface.by_city_id(3435910)

## By geographic coordinates
		
		response = OpenWeather::Interface.by_lat_lon(-34.62, -58.38)

## Changing units format		
You can change to metric or imperial units, for that you have to pass a hash with the key units:

		response = OpenWeather::Interface.by_city_id(3435910, {units: 'metric'})

		or

		response = OpenWeather::Interface..by_city_name('Santiago Del Estero', {units: 'imperial'})

## Changing languages		
You can use the lang key to get the output in another language:

		response = OpenWeather::Interface.by_city_id(3435910, {lang: 'es'})


You can see all the available language codes executing:

		OpenWeather::Languages::AVAILABLE

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brianfalah/open-weather-interface.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

