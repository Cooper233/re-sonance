extends Control

var personId:String


# Called when the node enters the scene tree for the first time.
func _ready():
	if personId!="":
		var pi=InfoManager.getPersonInstance(personId);
		$container/viewport/panel/avatar.texture=ResourceManager.getAvatar(pi);
		$panel/username.text=pi.name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_select_pressed():
	SongGlobalSignal.emit_signal("BW_SelectUser",personId)
