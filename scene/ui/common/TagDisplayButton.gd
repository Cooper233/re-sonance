extends TextureButton
func _ready():
	connect("pressed", _on_left_click)


func _input(event):
	if event is InputEventMouseButton:
		var rect = get_global_rect()
		if rect.has_point(event.global_position):
			if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
				_on_right_click()
				
func _on_left_click():
	TagGlobalSignal.emit_signal("TagDisplayButtonDown",0);

func _on_right_click():
	TagGlobalSignal.emit_signal("TagDisplayButtonDown",1);
