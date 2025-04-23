extends TextureRect

@export var normal_texture: Texture2D
@export var hover_texture: Texture2D

func _ready():
	texture = normal_texture
	mouse_filter = MOUSE_FILTER_STOP
	# 确保连接了信号
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	texture = hover_texture  # 修正拼写错误(hover_texture)

func _on_mouse_exited():
	texture = normal_texture
