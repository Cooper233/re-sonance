class_name InfoManager

static var dataLoadedFlag=false
static var staticPersons:Dictionary
static var personInstances:Dictionary
static var playerData:PlayerDataInstance
static var tagData:Dictionary
static var songData:Dictionary	


static var l1Tags:Array
static var l2Tags:Dictionary
static var speTags:Array

static func LoadResouces():
	if(dataLoadedFlag):
		return;
	var loc="res://res/data/person/staticPerson/"
	var dir=DirAccess.open(loc);
	if dir:
		dir.list_dir_begin()
		var file_name=dir.get_next()
		while file_name!="":
			var data=FileAccess.open(str(loc,file_name),FileAccess.READ)
			var json=JSON.parse_string(data.get_as_text())
			var tmp=StaticPersonBase.new();
			if json is Dictionary:
				tmp.init(json);
				staticPersons[tmp.id]=tmp;
				print("固定人物"+tmp.name+"读取完成");
			else:
				print("文件"+file_name+"读取失败")
			file_name=dir.get_next()
	var tspe=TagBase.new();
	tspe.id="special";
	tspe.name="特殊标签";
	#tagData[tspe.id]=tspe;
	registerTagBase(tspe);
	loc="res://res/data/tag/";
	dir=DirAccess.open(loc);
	if dir:
		dir.list_dir_begin();
		var file_name=dir.get_next()
		while file_name!="":
			var data=FileAccess.open(str(loc,file_name),FileAccess.READ)
			var json=JSON.parse_string(data.get_as_text())
			var tmp=TagBase.new();
			if json is Dictionary:
				tmp.init(json);
				registerTagBase(tmp);
				print("TAG-"+tmp.name+"读取完成");
			elif json is Array:
				for i in json:
					tmp=TagBase.new();
					tmp.init(i);
					registerTagBase(tmp);
					print("TAG-"+tmp.name+"读取完成");
			else:
				print("文件"+file_name+"读取失败")
			file_name=dir.get_next()
	loc="res://res/data/music/"
	dir=DirAccess.open(loc)
	if dir:
		dir.list_dir_begin();
		var file_name=dir.get_next()
		while file_name!="":
			var data=FileAccess.open(str(loc,file_name),FileAccess.READ)
			var json=JSON.parse_string(data.get_as_text())
			var tmp=MusicBase.new();
			if json is Dictionary:
				tmp.init(json);
				registerSongBase(tmp);
				print("SONG-"+tmp.name+"读取完成");
			elif json is Array:
				for i in json:
					tmp=MusicBase.new();
					tmp.init(i);
					registerSongBase(tmp);
					print("SONG-"+tmp.name+"读取完成");
			file_name=dir.get_next()
			
	
	dataLoadedFlag=true;
	
static func DEBUG():
	playerData=PlayerDataInstance.new();
	playerData.day=2;
	playerData.weather=PlayerDataInstance.Weather.SUNNY;
	for i in staticPersons.keys():
		var tmp=PersonInstance.new();
		tmp.loadFromStatic(getStaticPerson(i));
		registerPersonInstance(tmp);
static func getStaticPerson(id:String)->StaticPersonBase:
	LoadResouces()
	return staticPersons[id]
static func getPersonInstance(id:String)->PersonInstance:
	LoadResouces()
	return personInstances[id];
static func registerPersonInstance(pi:PersonInstance):
	personInstances[pi.id]=pi;
static func registerSongBase(song:MusicBase):
	songData[song.id]=song;
static func registerTagBase(tag:TagBase):
	if tag.father=="":
		if tag.isSpecial:
			tag.father="special"
			speTags.append(tag.id);
		else:
			l1Tags.append(tag.id);
	else:
		var tmp:Array
		if !l2Tags.has(tag.father):
			l2Tags[tag.father]=tmp;
		else:
			tmp=l2Tags[tag.father];
		tmp.append(tag.id);
	tagData[tag.id]=tag;
static func getTagData(id:String)->TagBase:
	LoadResouces()
	return tagData[id];
static func getSongData(id:String)->MusicBase:
	LoadResouces()
	return songData[id];
