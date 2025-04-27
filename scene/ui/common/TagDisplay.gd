extends Control

var id:String
var len:float

var mode:TagDisplayMode.Mode


# Called when the node enters the scene tree for the first time.
func _ready():
	#TagGlobalSignal.connect("TagDisplayButtonDown",_on_button_pressed);
	rerend();
func setId(x:String):
	id=x;
	rerend();

func rerend():
	if id=="":
		return;
	var data=InfoManager.getTagData(id);
	var name=str(data.name);
	$Control/Label.text=name
	len=20+$Control/Label.size.x;
	$Control/Label.position.x=len/2-$Control/Label.size.x/2;
	$".".custom_minimum_size.x=len;
	$Control/NinePatchRect.size.x=len;
	$Control/TextureButton.size.x=len;
func setDisplayColor(color):
	var tarC=Color.WHITE;
	if color is String:
		tarC=Color.from_string(color,Color.WHITE);
	elif color is Color:
		tarC=color;
	$Control/NinePatchRect.modulate=tarC;
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(str($".".global_position," ",id," ",mode))
	pass
func setMode(next:TagDisplayMode.Mode):
	mode=next;
func _on_button_pressed(mouse:int):
	#print(mode)
	if mode==TagDisplayMode.Mode.SELECT_L1:
		if mouse==0:
			TagGlobalSignal.emit_signal("WK_CheckL1Tag",id);
		else:
			TagGlobalSignal.emit_signal("WK_SelectL1Tag",id);
	elif mode==TagDisplayMode.Mode.SELECTED:
		if mouse==1:
			TagGlobalSignal.emit_signal("WK_DeselectTag",id);
	elif mode==TagDisplayMode.Mode.SELECT_L2:
		if mouse==0:
			TagGlobalSignal.emit_signal("WK_SelectL2Tag",id);
