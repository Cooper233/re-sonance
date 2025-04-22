class_name TagPersonInstance

var tagId:String;
var emotion:float;

func init(id,emo):
	tagId=id;
	emotion=emo;

func clone()->TagPersonInstance:
	var res=TagPersonInstance.new();
	res.tagId=tagId;
	res.emotion=emotion;
	return res;
