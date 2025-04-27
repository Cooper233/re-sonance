extends Control
var SongDisplay=preload("res://scene/ui/working/song_display.tscn")

var personlist:Array
var nowPerson:String
var personSelectedSong:Dictionary

func _ready():
	SongGlobalSignal.connect("WK_SelectSong",_on_Select_Song)
	SongGlobalSignal.connect("WK_DeselectSong",_on_Deselect_Song)
	rerend()

func setPersonList(list:Array):
	personlist=[]
	personlist.append_array(list)
	nowPerson=personlist[0];
	rerend()
func getPersonSelected(id:String)->Array:
	if !personSelectedSong.has(nowPerson):
		var selected=[]
		personSelectedSong[nowPerson]=selected
	return personSelectedSong[nowPerson]
	
func rerend():
	if nowPerson==""&&personlist.is_empty():
		return;
	if nowPerson=="":
		nowPerson=personlist[0]
	var person=InfoManager.getPersonInstance(nowPerson);
	$UserSelectedPanel/container/viewport/panel/avatar.texture=ResourceManager.getAvatar(person)
	$UserSelectedPanel/username.text=person.name;
	$UserSelectedPanel/userNum.text=str("用户 ",personlist.find(nowPerson)+1,"-",personlist.size())
	rerendSongBox()
func addSelectedSong(id:String):
	var song=InfoManager.getSongData(id);
	var si=SongDisplay.instantiate();
	si.setId(id);
	si.setLongMode(true)
	si.setMode(TagDisplayMode.SongMode.USER_PANEL)
	rendSelectedNum()
	$UserSelectedPanel/songBox/VBoxContainer.add_child(si);

func rendSelectedNum():
	var selected=getPersonSelected(nowPerson)
	$UserSelectedPanel/songNum.text=str("推荐数量 ",selected.size(),"/","5");

func rerendSongBox():
	for i in $UserSelectedPanel/songBox/VBoxContainer.get_children():
		$UserSelectedPanel/songBox/VBoxContainer.remove_child(i);
	var selected=getPersonSelected(nowPerson)
	rendSelectedNum()
	for i in selected:
		addSelectedSong(i)
func _on_left_pressed():
	var pos=personlist.find(nowPerson);
	if pos==0:
		return;
	nowPerson=personlist[pos-1];
	SongGlobalSignal.emit_signal("WK_ChangeSelectedPerson",nowPerson)
	rerend()


func _on_right_pressed():
	var pos=personlist.find(nowPerson);
	if pos==personlist.size()-1:
		return;
	nowPerson=personlist[pos+1];
	SongGlobalSignal.emit_signal("WK_ChangeSelectedPerson",nowPerson)
	rerend()

func _on_Select_Song(id:String):
	var sa=getPersonSelected(nowPerson);
	if sa.has(id):
		return;
	sa.append(id);
	addSelectedSong(id);
func _on_Deselect_Song(id:String):
	var sa=getPersonSelected(nowPerson);
	if !sa.has(id):
		return;
	sa.remove_at(sa.find(id));
	rerendSongBox()
