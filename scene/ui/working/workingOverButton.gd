extends Control

var timeLeft=60
var timeMax=60;

func _ready():
	rerend()
func rerend():
	$DismissButton/leftTime.value=100.0*timeLeft/timeMax;

func _process(delta):
	timeLeft-=delta;
	rerend()
