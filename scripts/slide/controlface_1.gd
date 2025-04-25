extends Container

var que_flag:bool=false;
var text_info:String;

# Called when the node enters the scene tree for the first time.
func _ready():
	que_flag=false;
	$Label.text=text_info;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if que_flag:
		queue_free();
