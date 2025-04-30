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
	data=PersonData.new()


func judgeSong(song:MusicBase)->int:
	var points=0;
	var num=0;
	for i in song.tag:
		var tag=InfoManager.getTagData(i);
		if tagEmotion.has(i):
			points+=tagEmotion[i].emotion;
			num+=1;
		elif tagEmotion.has(tag.father):
			points+=tagEmotion[tag.father].emotion/2;
			num+=1;
	if num==0:
		return 0
	if points/num>=2:
		return 1;
	if points/num<=-3:
		return -1;
	return 0;
func addSongHistory(song:MusicBase,date:int):
	var result=judgeSong(song);
	data.addSong(song,result,date)
