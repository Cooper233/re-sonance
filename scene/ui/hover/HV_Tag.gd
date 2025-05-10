extends Control

func _ready():
	rerend();
var tag:String
var person:String
func rerend():
	var tb=InfoManager.getTagData(tag);
	$NinePatchRect/tag.text=tb.name;
	var pi=InfoManager.getPersonInstance(person);
	var data=pi.data;
	var tt=data.tagTried.get(tag,0);
	var lt=data.tagSuccess.get(tag,0);
	var ct=data.tagCommon.get(tag,0);
	var dt=data.tagDislike.get(tag,0);
	$NinePatchRect/box/t1.text=str("尝试次数:",tt);
	$NinePatchRect/box/t2.text=str("喜欢次数:",lt);
	$NinePatchRect/box/t3.text=str("未收藏次数:",ct);
	$NinePatchRect/box/t4.text=str("不喜欢次数:",dt);
	
func setData(tagId:String,personId:String):
	tag=tagId;
	person=personId;
	rerend();
