extends Control

var timeLeft=100
var timeMax=100;

func _ready():
	rerend()
func rerend():
	var val=100.0*timeLeft/timeMax;
	$DismissButton/timeLeft.value=val
	if(val<=30):
		$DismissButton/timeLeft.modulate.g=val/30;
		$DismissButton/timeLeft.modulate.b=val/30;
	else:
		$DismissButton/timeLeft.modulate=Color.WHITE
	

func _process(delta):
	timeLeft-=delta;
	#print(pressed)
	if pressed:
		timeLeft-=delta*30
	rerend()
	if(timeLeft<=0):
		SongGlobalSignal.emit_signal("WK_WorkOver");

var pressed:bool


func _on_button_button_down():
	pressed=true


func _on_button_button_up():
	pressed=false
