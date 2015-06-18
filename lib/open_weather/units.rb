module OpenWeather
	class Units
		require 'ruby-enum'		
		include Ruby::Enum

		define :METRIC, "metric"
		define :IMPERIAL, "imperial"
	end
end