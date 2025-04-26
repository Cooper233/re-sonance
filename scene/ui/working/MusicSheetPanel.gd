extends Control

var TagDisplay=preload("res://scene/ui/common/TagDisplay.tscn");
var SongDisplay=preload("res://scene/ui/working/song_display.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	InfoManager.LoadResouces();
	rerendL1Tags();
	TagGlobalSignal.connect("WK_CheckL1Tag",onCheckL1);
	TagGlobalSignal.connect("WK_SelectL1Tag",onSelectL1);
	TagGlobalSignal.connect("WK_SelectL2Tag",onSelectL2);
	TagGlobalSignal.connect("WK_DeselectTag",onDeselectTag);
	
	#for i in range(10):
		#addSelectedTag("elec")
		#addSelectedTag("elec_syn")
		#addSelectedTag("elec_synwave")

var lastHBox=null;
var lastHBoxLen:float
var lastFilter:String
#TODO:有空之后用字典树进行优化
var usableTags:Array
var selectedL1:String
func rerendL1Tags():
	for i in $MusicSheetPanel/L1Tags/VBoxContainer.get_children():
		$MusicSheetPanel/L1Tags/VBoxContainer.remove_child(i);
	refreshUsableTags();
	for i in InfoManager.l1Tags:
		if usableTags.has(i):
			addL1Tag(i)
func refreshUsableTags():
	usableTags.clear();
	if lastFilter=="":
		usableTags.append_array(InfoManager.tagData.keys());
		return
	for i in InfoManager.tagData.keys():
		if usableTags.has(i):
			continue;
		var tag=InfoManager.getTagData(i);
		if tag.name.contains(lastFilter):
			usableTags.append(i);
			if tag.father!=""&&!usableTags.has(tag.father):
				usableTags.append(tag.father)
			elif tag.id!="special"&&tag.father=="":
				usableTags.append(InfoManager.l2Tags[tag.id])
var selectedTag:Array
func addSelectedTag(id:String,rerend=false):
	if selectedTag.has(id)&&!rerend:
		return false
	if lastHBox==null:
		lastHBox=HBoxContainer.new();
		lastHBox.custom_minimum_size.y=40
		$MusicSheetPanel/SelectedTags/VBoxContainer.add_child(lastHBox);
		lastHBoxLen=0.0
	var tmp=TagDisplay.instantiate();
	tmp.setId(id);
	tmp.setMode(TagDisplayMode.Mode.SELECTED);
	if(lastHBoxLen+tmp.len>=280):
		lastHBox=HBoxContainer.new();
		lastHBox.custom_minimum_size.y=40;
		$MusicSheetPanel/SelectedTags/VBoxContainer.add_child(lastHBox);
		lastHBoxLen=0;
	lastHBox.add_child(tmp);
	lastHBoxLen+=tmp.len;
	if!rerend:
		selectedTag.append(id);
	return true;
func rerendSelectedTag():
	lastHBox=null;
	lastHBoxLen=0;
	for i in $MusicSheetPanel/SelectedTags/VBoxContainer.get_children():
		$MusicSheetPanel/SelectedTags/VBoxContainer.remove_child(i);
	for i in selectedTag:
		addSelectedTag(i,true);
func addL1Tag(id:String):
	var tmp=TagDisplay.instantiate();
	tmp.setId(id);
	tmp.setMode(TagDisplayMode.Mode.SELECT_L1);
	var hbox=HBoxContainer.new();
	hbox.alignment=BoxContainer.ALIGNMENT_CENTER;
	hbox.custom_minimum_size.x=max(130,tmp.len);
	hbox.add_child(tmp);
	$MusicSheetPanel/L1Tags/VBoxContainer.add_child(hbox);
var lastH2Box=null;
var lastH2BoxLen=0;
func addL2Tag(id:String):
	if lastH2Box==null:
		lastH2Box=HBoxContainer.new();
		lastH2Box.custom_minimum_size.y=40
		$MusicSheetPanel/L2Tags/VBoxContainer.add_child(lastH2Box);
		lastH2BoxLen=0.0
	var tmp=TagDisplay.instantiate();
	tmp.setId(id);
	tmp.setMode(TagDisplayMode.Mode.SELECT_L2);
	#if selectedTag.has(id):
		#tmp.setDisplayColor()
	if(lastH2BoxLen+tmp.len>=340):
		lastH2Box=HBoxContainer.new();
		lastH2Box.custom_minimum_size.y=40;
		$MusicSheetPanel/L2Tags/VBoxContainer.add_child(lastH2Box);
		lastH2BoxLen=0;
	lastH2Box.add_child(tmp);
	lastH2BoxLen+=tmp.len;
func rerendL2Tags():
	for i in $MusicSheetPanel/L2Tags/VBoxContainer.get_children():
		$MusicSheetPanel/L2Tags/VBoxContainer.remove_child(i);
	lastH2Box=null;
	lastH2BoxLen=0;
	if selectedL1=="":
		return;
	elif selectedL1=="special":
		for i in InfoManager.speTags:
			if usableTags.has(i):
				addL2Tag(i)
	else:
		for i in InfoManager.l2Tags[selectedL1]:
			if usableTags.has(i):
				addL2Tag(i)
var lastHSBox=null;
var lastHSBoxNum=0;
var songNameFilter=""
func checkSongAvaliable(song:MusicBase)->bool:
	if songNameFilter!=""&&song.name.to_lower().contains(songNameFilter):
		return true;
	for i in song.tag:
		if selectedTag.has(i):
			return true;
	return false;
func rerendSongBox():
	for i in $MusicSheetPanel/Songs/VBoxContainer.get_children():
		$MusicSheetPanel/Songs/VBoxContainer.remove_child(i);
	if songNameFilter==""&&selectedTag.is_empty():
		#没有启用任何筛选器，默认不显示歌曲
		#可以在后续考虑随机显示几首
		pass
	lastHSBox=HBoxContainer.new();
	lastHSBoxNum=0;
	$MusicSheetPanel/Songs/VBoxContainer.add_child(lastHSBox);
	for i in InfoManager.songData.keys():
		var song=InfoManager.getSongData(i);
		if checkSongAvaliable(song):
			var si=SongDisplay.instantiate();
			si.setId(i);
			lastHSBox.add_child(si);
			lastHSBoxNum+=1;
			if lastHSBoxNum==2:
				lastHSBoxNum=0;
				lastHSBox=HBoxContainer.new();
				$MusicSheetPanel/Songs/VBoxContainer.add_child(lastHSBox);
		
# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	#print(selectedTag)
	pass


func onSelectL1(id:String):
	if id=="special":
		return;
	if addSelectedTag(id):
		pass
		#for i in $MusicSheetPanel/L1Tags/VBoxContainer.get_children(false):
			#var ttag=i.get_child(0);
			#if ttag.id==id:
				#ttag.setDisplayColor(Color.YELLOW)
				#break;
	rerendSongBox()
	
func onCheckL1(id:String):
	selectedL1=id;
	rerendL2Tags()
func onSelectL2(id:String):
	addSelectedTag(id);
	rerendSongBox()

func onDeselectTag(id:String):
	if selectedTag.has(id):
		#print(selectedTag.find(id))
		selectedTag.remove_at(selectedTag.find(id));
		rerendSelectedTag();
		#if usableTags.has(id):
			#if InfoManager.l1Tags.has(id):
				#for i in $MusicSheetPanel/L1Tags/VBoxContainer.get_children(false):
					#var ttag=i.get_child(0);
					#if ttag.id==id:
						#ttag.setDisplayColor(Color.WHITE)
						#break;
	rerendSongBox()


func _on_name_filter_text_changed(new_text):
	#$MusicSheetPanel/nameFilter.text=$MusicSheetPanel/nameFilter.text.replace("\n","")
	songNameFilter=new_text
	rerendSongBox()

func _on_filter_text_changed(new_text):
	lastFilter=new_text
	rerendL1Tags();
