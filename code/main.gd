extends Node2D

onready var Ma_in = $UI/Ma_in
onready var A_team = $UI/A_team
onready var B_team = $UI/B_team

func _ready():
	# 添加测试
	Ma_in.add_item("miao",2)
	print(Ma_in.get_item_text(2))
	A_team.modulate = Color(0,0,0,1)
	B_team.modulate = Color(1,1,1,1)
	
	pass
