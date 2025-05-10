extends Control

var TagDisplay=preload("res://scene/ui/common/TagDisplay.tscn")

var person:String

func _ready():
	SongGlobalSignal.connect("WK_ChangeSelectedPerson",onSelectPerson);
	rerend();

var lastHbox
var lastHboxLen
func rerend():
	if person=="":
		return
	for i in $RecommendedTags/ScrollContainer/VBoxContainer.get_children():
		$RecommendedTags/ScrollContainer/VBoxContainer.remove_child(i);
	lastHbox=HBoxContainer.new();
	lastHboxLen=0;
	$RecommendedTags/ScrollContainer/VBoxContainer.add_child(lastHbox)
	var pi=InfoManager.getPersonInstance(person);
	var data=pi.data;
	for i in data.tagTried.keys():
		var tt=data.tagTried.get(i);
		var lt=data.tagSuccess.get(i,0);
		var ct=data.tagCommon.get(i,0);
		var dt=data.tagDislike.get(i,0);
		var td=TagDisplay.instantiate();
		td.setId(i);
		td.setPerson(person);
		var cl=Color.GRAY;
		if lt>dt:
			cl=Color.GREEN_YELLOW;
		if lt<dt:
			cl=Color.RED
		td.setDisplayColor(cl);
		if lastHboxLen+td.len>=$RecommendedTags/ScrollContainer.size.x-10:
			lastHbox=HBoxContainer.new()
			lastHboxLen=0;
			$RecommendedTags/ScrollContainer/VBoxContainer.add_child(lastHbox)
		td.setMode(TagDisplayMode.Mode.DISPLAY);
		lastHbox.add_child(td);
		lastHboxLen+=td.len;
		


func onSelectPerson(id:String):
	person=id;
	rerend();
