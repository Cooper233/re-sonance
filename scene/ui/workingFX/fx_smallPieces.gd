extends Node2D


@export var texture=preload("res://res/img/background/working/bg_pieces_back.png");
@export var dura=20
@export var speed=10
@export var k=-0.56
@export var randomSpeed=false;


var statue=1;
var last=0;
var originPos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	$piece.texture=texture;
	originPos=Vector2($".".position)
	if randomSpeed:
		speed=(randf()*3+0.7)*speed
	dura=(randf()*3+0.7)*dura;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	last+=delta;
	if statue==1:
		$".".position+=Vector2(speed,speed*k)*delta
		if last>=dura:
			statue=2;
			last=0;
	elif statue==2:
		$".".position+=Vector2(speed,speed*k)*delta
		$piece.modulate.a=1.0-last/2.0
		if last>=3:
			statue=0;
			last=0;
			$".".position=Vector2(originPos);
	else:
		$".".position+=Vector2(speed,speed*k)*delta
		$piece.modulate.a=last
		if last>=1.0:
			statue=1;
			last=0;
