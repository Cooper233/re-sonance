extends Control


signal start_game;
signal read_load;
signal save_load;
signal seting;
signal exit;

var start_scope:bool=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_startgame_button_down():
	emit_signal("start_game");


func _on_readload_button_down():
	emit_signal("read_load");


func _on_saveload_button_down():
	emit_signal("save_load");


func _on_seting_button_down():
	emit_signal("seting");


func _on_exit_button_down():
	emit_signal("exit");


func _on_area_2d_mouse_entered():
	start_scope=true;
	print(1)


func _on_area_2d_mouse_exited():
	start_scope=false;

