class_name ResourceManager
static func getAvatar(person:PersonInstance):
	var loc=str("res://res/img/avatar/",person.avatar+".png");
	var text=load(loc);
	return text
