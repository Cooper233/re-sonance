extends Node2D

const  AWI=preload("res://scene/ui/working.tscn");
const  BGFX=preload("res://scene/ui/woking_background.tscn");

signal scene_change_requested2;

# Called when the node enters the scene tree for the first time.
func _ready():
	var awi=AWI.instantiate();
	var bgfx=BGFX.instantiate();
	$ui.add_child(awi);
	$bg_fx.add_child(bgfx);

	if awi.has_signal("scene_change_requested2"):
		awi.scene_change_requested2.connect(_on_scene_change_requested2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_scene_change_requested2():
	emit_signal("scene_change_requested2");
