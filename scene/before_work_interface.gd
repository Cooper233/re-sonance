extends Node2D

const  AWI=preload("res://scene/ui/before_work.tscn");
const  BGFX=preload("res://scene/ui/woking_background.tscn");

var personList:Array

signal scene_change_requested;

# Called when the node enters the scene tree for the first time.
func _ready():
	InfoManager.LoadResouces()
	InfoManager.DEBUG()
	##DEBUG部分
	##TODO:删去DEBUG
	personList=InfoManager.personInstances.keys();
	##DEBUG部分结束
	var awi=AWI.instantiate();
	var bgfx=BGFX.instantiate();
	awi.personList=personList;
	$ui.add_child(awi);
	$bg_fx.add_child(bgfx);
	$AudioStreamPlayer.volume_db=-80;
	if awi.has_signal("scene_change_requested"):
		awi.scene_change_requested.connect(_on_scene_change_requested)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($AudioStreamPlayer.volume_db)
	$AudioStreamPlayer.volume_db=min(0.0,$AudioStreamPlayer.volume_db-lerp($AudioStreamPlayer.volume_db,0.0,0.5)*delta)


func _on_scene_change_requested():
	emit_signal("scene_change_requested");
