extends Node2D

signal scene_change_requested3;

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.volume_db=-80;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer.volume_db=min(0.0,$AudioStreamPlayer.volume_db-lerp($AudioStreamPlayer.volume_db,0.0,0.5)*delta)


func _on_bluebutton_13_button_down():
	InfoManager.playerData.addDate()
	emit_signal("scene_change_requested3");
