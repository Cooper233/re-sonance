class_name MusicBase
var id:String
var name:String
var album:String
var singer:Array
var tag:Array
var emotion

func init(json:Dictionary):
	id=json.get("id");
	name=json.get("name");
	album=json.get("album");
	singer=json.get("singer");
	tag=json.get("tag");
