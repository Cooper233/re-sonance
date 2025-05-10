extends Control

@export var before_work_scene: PackedScene
@export var basic_interface_design_scene: PackedScene
@export var after_work_interface_design_scene: PackedScene
@export var menu_scene: PackedScene

var current_scene: Node = null

func _ready():
	# 初始化加载第一个场景
	call_deferred("switch_scene", menu_scene)

func switch_scene(target_scene: PackedScene):
	# 参数有效性检查
	if not target_scene:
		push_error("目标场景未配置!")
		return

	# 安全移除旧场景
	if current_scene:
		remove_child(current_scene)
		current_scene.queue_free()

	# 实例化新场景
	var new_scene = target_scene.instantiate()
	add_child(new_scene)
	current_scene = new_scene

	# 动态连接信号
	_connect_scene_signals(new_scene)

func _connect_scene_signals(scene: Node):
	# 自动连接所有支持的信号
	if scene.has_signal("scene_change_requested"):
		scene.scene_change_requested.connect(_on_scene_change_requested)
	if scene.has_signal("scene_change_requested2"):
		scene.scene_change_requested2.connect(_on_scene_change_requested2)
	if scene.has_signal("scene_change_requested3"):
		scene.scene_change_requested3.connect(_on_scene_change_requested3)
	if scene.has_signal("start_game"):
		scene.start_game.connect(start_game_sel)
	if scene.has_signal("read_load"):
		scene.read_load.connect(read_load_sel)
	if scene.has_signal("save_load"):
		scene.save_load.connect(save_load_sel)
	if scene.has_signal("seting"):
		scene.seting.connect(seting_sel)
	if scene.has_signal("exit"):
		scene.exit.connect(exit_sel)
	

func _on_scene_change_requested():
	switch_scene(basic_interface_design_scene)

func _on_scene_change_requested2():
	switch_scene(after_work_interface_design_scene)
	
func _on_scene_change_requested3():
	switch_scene(before_work_scene)
	
func start_game_sel():
	switch_scene(before_work_scene)
func read_load_sel():
	pass;
func save_load_sel():
	pass;
func seting_sel():
	pass;
func exit_sel():
	get_tree().quit();

