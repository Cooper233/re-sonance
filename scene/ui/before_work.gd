extends Control

var personList:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	$UserSelectPanel.personList=personList;
	$UserSelectPanel.rerend()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
