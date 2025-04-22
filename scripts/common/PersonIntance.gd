class_name PersonInstance

var name:String
var id:String
var avatar:String

var tagEmotion:Dictionary

enum PersonEmotion{
	NORMAL,
	HAPPY,
	NERVOUS,
	SAD
}

var personEmo=PersonEmotion.NORMAL
var data:PersonData

func loadFromStatic(spb):
	if spb is StaticPersonBase:
		name=spb.name
		id="static_"+spb.id;
		avatar="static_"+spb.id;
		for i in spb.tagEmotion.keys():
			tagEmotion[i]=spb.tagEmotion[i].clone()


