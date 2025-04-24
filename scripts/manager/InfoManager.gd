class_name InfoManager

static var dataLoadedFlag=false
static var staticPersons:Dictionary
static var personInstances:Dictionary
static var playerData:PlayerDataInstance

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
	return staticPersons[id]
static func getPersonInstance(id:String)->PersonInstance:
	return personInstances[id];
static func registerPersonInstance(pi:PersonInstance):
	personInstances[pi.id]=pi;
