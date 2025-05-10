extends Control
func _ready():
	rerend();
func rerend():
	var data=InfoManager.playerData;
	var s=data.getWeatherString();
	$Container/bg.texture=load("res://res/img/UI/addons/before_"+s+".png");
	$DayinfoPanel/Label.text=str("DAY ",data.day);
