extends Control
var SongDisplay=preload("res://scene/ui/working/song_display.tscn")
var person:String;
var songs:Array
class TmpUnit:
	var id:String;
	var date:int;
func _ready():
	rerend()
func rerend():
	position=Vector2(0,0)
	songs.clear();
	for i in $ScrollContainer/VBoxContainer.get_children():
		$ScrollContainer/VBoxContainer.remove_child(i);
	var pi=InfoManager.getPersonInstance(person);
	var data=pi.data;
	for i in data.songRecommandDate:
		var tmp=TmpUnit.new();
		tmp.id=i;
		tmp.date=data.songRecommandDate[i];
		songs.append(tmp);
	songs.sort_custom(func(a,b):return a.id<b.id if a.date==b.date else a.date>b.date);
	for i in songs:
		var hbox=HBoxContainer.new();
		var disp=SongDisplay.instantiate();
		disp.setId(i.id);
		disp.setLongMode(true);
		var flag=data.songRecommandResult[i.id];
		var text=load("res://res/img/UI/checkmark.png");
		match flag:
			0:
				text=load("res://res/img/UI/contrast.png")
			-1:
				text=load("res://res/img/UI/cross.png")
		var tc=TextureRect.new();
		tc.texture=text;
		tc.scale=Vector2(1.5,1.5)
		hbox.add_child(disp);
		hbox.add_child(tc);
		$ScrollContainer/VBoxContainer.add_child(hbox)
