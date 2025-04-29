extends Control

var timeLeft=20
var timeMax=20;

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
	rerend()
	if(timeLeft<=0):
		SongGlobalSignal.emit_signal("WK_WorkOver");
