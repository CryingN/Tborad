extends Node2D

var A_team_color:Color = Color(0.73,0,0,1)
var B_team_color:Color = Color(0.3,0.2,0.79,1)
var num_ma_in:int = 0

var player = preload('res://scene/player.tscn')

onready var Ma_in = $UI/Ma_in
onready var A_team = $UI/A_team
onready var B_team = $UI/B_team
onready var delete = $UI/delete

func _ready():
	# test place
	Ma_in.add_item("miao",2)
	print(bool(Ma_in.get_item_text(2) == "miao"))
	
	# _ready() place
	A_team.modulate = A_team_color
	B_team.modulate = B_team_color
	pass

# A_team button, it used to create new player.tscn.
func _on_A_team_pressed():
	var the_player = player.instance()
	the_player.the_color = A_team_color
	the_player.number = 233
	the_player.position = Vector2(100,100)
	add_child(the_player)
	pass

# B_team button, like _on_A_team_pressed().
func _on_B_team_pressed():
	var the_player = player.instance()
	the_player.the_color = B_team_color
	the_player.number = 234
	the_player.position = Vector2(700,1300)
	add_child(the_player)
	pass

# arrow checkbutton
## true is arrow mode
## false is station mode
func _on_arrow_toggled(button_pressed):
	if button_pressed:
		Global.station = false
	else:
		Global.station = true
	pass



func _on_station_toggled(button_pressed):
	if button_pressed:
		pass
	pass
	
# save
func _on_save_pressed(_name):
	if num_ma_in == 0:
		Ma_in.add_item("miao",2)
		Global.pt("# create data {key} in Ma_in".format({key = "name"}))
	print(bool(Ma_in.get_item_text(2) == "miao"))
	pass

# if the player will be delete, be red.
func _on_delete_pressed():
	if Global.station:
		delete.modulate = Color(1,0,0,0.78)
		Global.clean = true
	pass

# drag here to delete the player.
func _on_delete_released():
	delete.modulate = Color(1, 1, 1, 1)
	Global.clean = false
	pass

