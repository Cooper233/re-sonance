extends Control

# 导出场景资源
@export var before_work_scene: PackedScene
@export var basic_interface_design_scene: PackedScene

# 当前加载的场景实例
var current_scene: Node = null

func _ready():
	# 初始加载第一个场景
	switch_scene(before_work_scene)
	
	# 连接信号（假设 BeforeWork 场景有自定义信号）
	if current_scene.has_signal("scene_change_requested"):
		current_scene.scene_change_requested.connect(_on_scene_change_requested)

func switch_scene(target_scene: PackedScene):
	# 清理旧场景
	if current_scene:
		current_scene.queue_free()
	
	# 加载新场景
	var new_scene = target_scene.instantiate()
	get_tree().current_scene.add_child(new_scene)
	current_scene = new_scene

	# 更新场景树
	get_tree().current_scene = new_scene

func _on_scene_change_requested():
	# 切换场景并传递参数
	switch_scene(basic_interface_design_scene)

