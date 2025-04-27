extends Control


var playerData:PlayerDataInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#TODO: 删去DEBUG
	InfoManager.LoadResouces();
	InfoManager.DEBUG()
	
	playerData=InfoManager.playerData
	$DayPanel/day.text=str("DAY\n",playerData.day)
	
	$workingUserPanel.setPersonList(InfoManager.personInstances.keys())


# Called every frame. 'delta' is the elapsed time since the previous frame.
var tarpos;
func _process(delta):
	var mp=get_global_mouse_position();
	var size=$".".size;
	tarpos=-(mp-size/2)*0.05;
	$".".position+=(lerp($".".position,tarpos,4)-$".".position)*delta;
