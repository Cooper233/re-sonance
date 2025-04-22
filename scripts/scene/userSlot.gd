extends Control

var personId:String


# Called when the node enters the scene tree for the first time.
func _ready():
	if personId!=null:
		var pi=InfoManager.getPersonInstance(personId);
		$container/viewport/panel/avatar.texture=ResourceManager.getAvatar(pi);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
