extends Control

@export var face1:PackedScene;

var flag:int=0;

var face_1: Node = null  # 显式声明变量并初始化为 null
var face_2: Node = null
var face_3: Node = null
var f1 := false
var f2 := false
var f3 := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flag == 1 and not f1:  # 避免重复实例化
		# 移除旧的 face_2（如果存在）
		if face_2:
			face_2.queue_free()
			face_2 = null
		if face_3:
			face_3.queue_free()
			face_3 = null
		
		# 创建新的 face_1
		face_1 = face1.instantiate()
		face_1.position = Vector2(595, 359)
		face_1.text_info = "你好"
		get_tree().current_scene.add_child(face_1)
		f1 = true
		f2 = false
		f3 = false

	elif flag == 2 and not f2:  # 使用 elif 避免重复检查
		# 移除旧的 face_1（如果存在）
		if face_1:
			face_1.queue_free()
			face_1 = null
		if face_3:
			face_3.queue_free()
			face_3 = null
		
		# 创建新的 face_2
		face_2 = face1.instantiate()
		face_2.position = Vector2(595, 359)
		face_2.text_info = "你是个铸币"
		get_tree().current_scene.add_child(face_2)
		f2 = true
		f1 = false
		f3 = false

	if flag == 3 and not f3:  # 避免重复实例化
		# 移除旧的 face_2（如果存在）
		if face_2:
			face_2.queue_free()
			face_2 = null
		if face_1:
			face_1.queue_free()
			face_1 = null
		
		# 创建新的 face_1
		face_3 = face1.instantiate()
		face_3.position = Vector2(595, 359)
		face_3.text_info = "我喜欢你"
		get_tree().current_scene.add_child(face_3)
		f3 = true
		f2 = false
		f1 = false

	# 清理逻辑（原代码有错误，已修正）
	if face_1 and not f1:
		face_1.queue_free()
		face_1 = null  # 避免悬空引用

	if face_2 and not f2:
		face_2.queue_free()
		face_2 = null
	
	if face_3 and not f3:
		face_3.queue_free()
		face_3 = null


func _on_info_button_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$InfoButton.z_index=3;
		if(flag==2):
			$RecentButton.z_index=2;
			$SNSButton.z_index=1;
		elif(flag==3):
			$RecentButton.z_index=1;
			$SNSButton.z_index=2;
		flag=1;


func _on_recent_button_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$RecentButton.z_index=3;
		if(flag==1):
			$InfoButton.z_index=2;
			$SNSButton.z_index=1;
		elif(flag==3):
			$InfoButton.z_index=1;
			$SNSButton.z_index=2;
		flag=2;


func _on_sns_button_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		$SNSButton.z_index=3;
		if(flag==1):
			$InfoButton.z_index=2;
			$RecentButton.z_index=1;
		elif(flag==2):
			$InfoButton.z_index=1;
			$RecentButton.z_index=2;
		flag=3;
