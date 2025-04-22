class_name StaticPersonBase

var id:String
var name:String
var tagEmotion:Dictionary

func init(json:Dictionary):
	id=json.get("id");
	name=json.get("name");
	var tags=json.get("tagEmotion");
	for i in tags.keys():
		var val=tags.get(i);
		var tmp=TagPersonInstance.new();
		tmp.init(i,val);
		tagEmotion[i]=tmp
