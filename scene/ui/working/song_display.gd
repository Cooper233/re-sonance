extends Control

var TagDisplay=preload("res://scene/ui/common/TagDisplay.tscn")

var id:String
var mode:TagDisplayMode.SongMode
var longMode:bool
var person:String

func _ready():
	rerend()
func rerend():
	if id=="":
		return;
	if longMode:
		$panel.size.x=400/0.51
		$TagComp.size.x=400
		$button.size.x=400
		$".".size.x=420
		$".".custom_minimum_size.x=420
	var song=InfoManager.getSongData(id);
	$panel2/album.texture=ResourceManager.getAlbumImg(song);
	var ns="";
	for i in song.singer:
		ns=str(ns," ",i)
	$name.text=str(song.name," - ",ns);
	for i in $TagComp.get_children():
		$TagComp.remove_child(i);
	var len=0;
	for i in song.tag:
		var tag=InfoManager.getTagData(i);
		var ti=TagDisplay.instantiate();
		ti.setId(tag.id);
		ti.setMode(TagDisplayMode.Mode.DISPLAY)
		ti.setPerson(person)
		len+=ti.len;
		if len>=(165+(230 if longMode else 0)):
			break
		$TagComp.add_child(ti);
func setId(x:String):
	id=x;
	rerend();
func setMode(x:TagDisplayMode.SongMode):
	mode=x;
func setLongMode(x:bool):
	longMode=x;
	rerend()
func setPerson(x:String):
	person=x;

func _on_button_pressed(mouse:int):
	if mouse==0:
		if mode==TagDisplayMode.SongMode.SHEET:
			SongGlobalSignal.emit_signal("WK_SelectSong",id)
	elif mouse==1:
		if mode==TagDisplayMode.SongMode.USER_PANEL:
			SongGlobalSignal.emit_signal("WK_DeselectSong",id)


