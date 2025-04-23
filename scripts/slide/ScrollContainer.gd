extends ScrollContainer

#var isdrag=false;
#var starpos=0;
var set_flag:bool=false;
var slide_conter:float=0;


# Called when the node enters the scene tree for the first time.
func _ready():
	set_horizontal_scroll_mode(3);




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if set_flag:
		if(slide_conter<10):
			set_h_scroll(get_h_scroll()+slide_conter);
			slide_conter+=0.01;
	else:
		if(slide_conter>0):
			set_h_scroll(get_h_scroll()-slide_conter);
			slide_conter-=0.01;


#func _on_gui_input(event):
#	if event is InputEventMouseButton and event.is_pressed():
#		isdrag=true;
#		starpos=event.position.y;
#	if event is InputEventMouseButton and !event.is_pressed():
#		isdrag=false;
#		starpos=0;
#	if isdrag:
#		var offset=event.position.y-starpos;
#		set_v_scroll(get_v_scroll()+(-offset));		


func _on_mouse_entered():
	set_flag=true;


func _on_mouse_exited():
	set_flag=false;
