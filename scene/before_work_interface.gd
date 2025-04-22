extends Node2D

const  AWI=preload("res://scene/ui/before_work.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	var awi=AWI.instantiate();
	$ui.add_child(awi);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
