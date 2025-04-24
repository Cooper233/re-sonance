extends Control

signal selected_person(personid)

var USERSLOT=preload("res://scene/ui/BeforeWork/userSlot.tscn");

var personList:Array
# Called when the node enters the scene tree for the first time.
func _ready():
	rerend()
func rerend():
	for i in $panel/sc/vbc.get_children(false):
		$panel/sc/vbc.remove_child(i);
	for i in personList:
		var hbox=HBoxContainer.new();
		hbox.custom_minimum_size.y=140;
		var slot=USERSLOT.instantiate();
		slot.personId=i;
		hbox.add_child(slot);
		$panel/sc/vbc.add_child(hbox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
