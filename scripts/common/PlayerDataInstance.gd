class_name PlayerDataInstance

var day:int

enum Weather{
	NORMAL,
	CLOUDY,
	RAINING
}

var weather:Weather

func getWeatherString()->String:
	return str(Weather.keys()[weather]).to_lower()

func addDate():
	day+=1;
