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
    end

    def self.by_city_id(city_id, options = {})
      options[:id] = city_id      
      parse_response(self.get("", query: options))  
    end

    def self.by_lat_lon(lat, lon, options = {})
      options[:lat] = lat
      options[:lon] = lon
      parse_response(self.get("", query: options))  
    end

    def self.by_zip(zip_code, country_code, options = {})
      options[:zip] = "#{zip_code},#{country_code}"        
      parse_response(self.get("", query: options))  
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
