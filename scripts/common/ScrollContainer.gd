extends ScrollContainer

var isdrag:bool=false;
var starpos=0;


func _on_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		isdrag=true;
		starpos=event.position.y;
	if event is InputEventMouseButton and !event.is_pressed():
		isdrag=false;
		starpos=0;
	
	if isdrag:
		var offset=event.position.y-starpos;
		self.set_v_scroll(self.get_v_scroll()+(-offset));
		starpos=event.position.y;
