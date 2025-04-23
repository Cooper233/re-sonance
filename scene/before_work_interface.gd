extends Node2D

const  AWI=preload("res://scene/ui/before_work.tscn");
const  BGFX=preload("res://scene/ui/woking_background.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	InfoManager.LoadResouces()
	var awi=AWI.instantiate();
	var bgfx=BGFX.instantiate();
	$ui.add_child(awi);
	$bg_fx.add_child(bgfx);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
