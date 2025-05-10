extends Container


var set_flag:bool=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if set_flag:
		if(self.position.x>1264):
			self.position.x-=350*delta;
		else:
			self.position.x=1264;
	else:
		if(self.position.x<1492):
			self.position.x+=350*delta;
		else:
			self.position.x=1492;


func _on_mouse_entered():
	set_flag=true;


func _on_mouse_exited():
	set_flag=false;

