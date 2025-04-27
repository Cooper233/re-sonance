class_name TagBase

var id:String;
var name:String;
var father:String
var isSpecial:bool

func init(json:Dictionary):
	id=json.get("id");
	name=json.get("name");
	father=json.get("father","");
	isSpecial=json.get("isSpecial",false)
