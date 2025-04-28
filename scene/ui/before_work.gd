extends Control

var personList:Array
signal scene_change_requested;


# Called when the node enters the scene tree for the first time.
func _ready():
	$UserSelectPanel.personList=personList;
	$UserSelectPanel.rerend()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_start_button_button_down():
	emit_signal("scene_change_requested");
