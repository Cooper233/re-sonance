extends Control

var TagDisplay=preload("res://scene/ui/common/TagDisplay.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	InfoManager.LoadResouces();
	rerendL1Tags();
	TagGlobalSignal.connect("WK_CheckL1Tag",onCheckL1);
	TagGlobalSignal.connect("WK_SelectL1Tag",onSelectL1);
	
	#for i in range(10):
		#addSelectedTag("elec")
		#addSelectedTag("elec_syn")
		#addSelectedTag("elec_synwave")

var lastHBox=null;
var lastHBoxLen:float
var lastFilter:String
#TODO:有空之后用字典树进行优化
var usableTags:Array
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
		if i.contains(lastFilter):
			usableTags.append(i);
			if tag.father!=""&&!usableTags.has(tag.father):
				usableTags.append(tag.father)
			
func addSelectedTag(id:String):
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
	
func addL1Tag(id:String):
	var tmp=TagDisplay.instantiate();
	tmp.setId(id);
	tmp.setMode(TagDisplayMode.Mode.SELECT_L1);
	var hbox=HBoxContainer.new();
	hbox.alignment=BoxContainer.ALIGNMENT_CENTER;
	hbox.custom_minimum_size.x=max(130,tmp.len);
	hbox.add_child(tmp);
	$MusicSheetPanel/L1Tags/VBoxContainer.add_child(hbox);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onFilterTextChange():
	lastFilter=$MusicSheetPanel/filter.text
	rerendL1Tags();
func onSelectL1(id:String):
	addSelectedTag(id);
func onCheckL1(id:String):
	print("cheeeeeeeeeeeeeeeck")
