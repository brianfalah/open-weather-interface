module OpenWeather
  class Interface   
    require 'httparty' 
    require 'active_support/core_ext/object'

    include HTTParty

    base_uri 'http://api.openweathermap.org/data/2.5/weather'    

    def self.by_city_name(city, options = {})      
      valid, error = validate_options(options)
      if valid
        options[:q] = city
        if options[:country_code]
          options[:q] += ",#{options[:country_code]}"        
        end
        parse_response(self.get("", query: options))  
      else
        custom_response(error)
      end
    end

    def self.by_city_id(city_id, options = {})
      valid, error = validate_options(options)
      if valid
        options[:id] = city_id      
        parse_response(self.get("", query: options))  
      else
        custom_response(error)
      end
    end

    def self.by_lat_lon(lat, lon, options = {})
      valid, error = validate_options(options)
      if valid
        options[:lat] = lat
        options[:lon] = lon
        parse_response(self.get("", query: options))  
      else
        custom_response(error)
      end
    end

    def self.by_zip(zip_code, country_code, options = {})
      valid, error = validate_options(options)
      if valid
        options[:zip] = "#{zip_code},#{country_code}"        
        parse_response(self.get("", query: options))  
      else
        custom_response(error)
      end
    end

    protected

    def self.validate_options(options)
      permitted = [:country_code, :units, :lang ]

      options.each do |key, value|
        if !permitted.include?(key)
          return false, "parameter #{key} is not permitted" 
        else
          return false, "empty value for parameter #{key}" if value.blank?            

          if key == :units
            return false, "#{value} is not a valid unit" if !Units.values.include?(value.to_s.downcase)
          end
          if key == :lang
            return false, "#{value} is not a valid language" if !Languages::AVAILABLE.include?(value.to_s.downcase)
          end          
        end
      end

      true
    end

    def self.custom_response(error)
      {'cod' => 404, 'message' => error}      
    end

    def self.parse_response(response)
      if response.code == 200
        parsed_response = JSON.parse(response.body)
        #casting cod to int because when the api returns 404, it comes as a string
        parsed_response['cod'] = parsed_response['cod'].to_i
        parsed_response
      else
        return false
      end
    end

  end
end
