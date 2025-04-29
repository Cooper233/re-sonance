extends Control


var playerData:PlayerDataInstance

signal scene_change_requested2;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#TODO: 删去DEBUG
	InfoManager.LoadResouces();
	InfoManager.DEBUG()
	
	playerData=InfoManager.playerData
	
	SongGlobalSignal.connect("WK_WorkOver",onWorkOver)
	$DayPanel/day.text=str("DAY\n",playerData.day)
	
	$workingUserPanel.setPersonList(InfoManager.personInstances.keys())


# Called every frame. 'delta' is the elapsed time since the previous frame.
var tarpos;
func _process(delta):
	var mp=get_global_mouse_position();
	var size=$".".size;
	tarpos=-(mp-size/2)*0.05;
	$".".position+=(lerp($".".position,tarpos,4)-$".".position)*delta;


func _on_working_over_button_gui_input(event):
	#if event is InputEventMouseButton and event.is_pressed():
		#emit_signal("scene_change_requested2");
	pass

func onWorkOver():
	emit_signal("scene_change_requested2");

