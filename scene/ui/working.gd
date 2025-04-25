extends Control


var playerData:PlayerDataInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#TODO: 删去DEBUG
	InfoManager.LoadResouces();
	InfoManager.DEBUG()
	
	playerData=InfoManager.playerData
	$DayPanel/day.text=str("DAY\n",playerData.day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
