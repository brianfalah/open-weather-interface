module OpenWeather
  class Interface   
    require 'httparty' 
    include HTTParty    
    # require 'singleton'
    # include Singleton

    base_uri 'http://api.openweathermap.org/data/2.5/weather'
    #attr_reader :interval

    # def initialize()
    #   @interval = 3 #intervalo de horas para pedir el servicio dentro de un mismo dia
    # end



    def self.by_city_name(city, options = {})
      options[:q] = city
      if options[:country_code]
        options[:q] += ",#{options[:country_code]}"        
      end
      parse_response(self.get("", query: options))  
      # new(options.merge(city: city)).retrive
    end

    protected
    
    def self.parse_response(response)
      if response.code == 200
        JSON.parse(response.body)
      else
        return false
      end
    end

  end
end
