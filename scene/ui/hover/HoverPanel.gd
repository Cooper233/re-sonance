extends Control

var HV_Tag=preload("res://scene/ui/hover/HV_Tag.tscn")

func _ready():
	TagGlobalSignal.connect("WK_CheckTagInfo",onCheckTag)
	TagGlobalSignal.connect("WK_DecheckTagInfo",onDecheckTag)
var tagCheckUnit;
func _process(delta):
	relocate()
func relocate():
	var mpos=$".".get_local_mouse_position();
	if tagCheckUnit!=null:
		tagCheckUnit.position=mpos;
func onCheckTag(tag:String,person:String):
	var hv=HV_Tag.instantiate();
	hv.setData(tag,person);
	tagCheckUnit=hv;
	$".".add_child(tagCheckUnit);
func onDecheckTag(tag:String,person:String):
	$".".remove_child(tagCheckUnit);
	tagCheckUnit=null;
