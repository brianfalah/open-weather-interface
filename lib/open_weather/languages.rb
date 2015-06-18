module OpenWeather
	class Languages
		require 'ruby-enum'		
		include Ruby::Enum

		define :AVAILABLE, ['en', 'ru', 'it', 'es', 'sp', 'uk', 'ua', 'de', 'pt', 'ro', 'pl',
		 'fi', 'nl', 'fr', 'bg', 'sv', 'se', 'zh_tw', 'zh', 'zh_cn', 'tr', 'hr', 'ca' ]
	end
end