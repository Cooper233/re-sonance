extends TextureButton

var flag_scope:bool=false;



func _on_area_2d_mouse_entered():
	flag_scope=true;
	print("yes")


func _on_area_2d_mouse_exited():
	flag_scope=false;
	print("no")
