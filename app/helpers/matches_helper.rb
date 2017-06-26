module MatchesHelper

  require 'open_weather'


  def get_weather(match)

  end




  def get_weather_api(match)

    if match.date == Date.today
      options = {  APPID: "52cc139353dcc37cf8007ac4e5217829" }
      weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{match.latitude}&lon=#{match.longitude}&appid=52cc139353dcc37cf8007ac4e5217829")

      return weather['weather'][0]['main'], (weather['main']['temp_max']-273).to_i
    else

      options = {  APPID: "52cc139353dcc37cf8007ac4e5217829" }
      weather = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{match.latitude}&lon=#{match.longitude}&appid=52cc139353dcc37cf8007ac4e5217829")

      for element in weather['list']
        if element['dt_txt'][0,10] == match.date.to_s
          if element['dt_txt'][11,16].to_i > match.time.to_s[11,8].to_i
            return element['weather'][0]['main'], (element['main']['temp_max']-273).to_i
          end
        end
      end
    end
    nil
  end
end
