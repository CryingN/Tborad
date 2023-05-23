extends Node2D

var A_team_color:Color = Color(0.73,0,0,1)
var B_team_color:Color = Color(0.3,0.2,0.79,1)
var num : int = 1
var num_ma_in:int = 0
var color : Color
var the_position : Vector2
var the_name : String

const player = preload('res://scene/player.tscn')
const new_arrow = preload('res://scene/arrow.tscn')

onready var Ma_in = $UI/Ma_in
onready var A_team = $UI/A_team
onready var B_team = $UI/B_team
onready var delete = $UI/delete
onready var the_spin = $num_UI/background/SpinBox
onready var spinbox = $num_UI
onready var namebox = $num_UI/background/nameBox

func _ready():
	# test place
	Ma_in.add_item("miao",2)
	print(bool(Ma_in.get_item_text(2) == "miao"))
	# _ready() place
	A_team.modulate = A_team_color
	B_team.modulate = B_team_color
	pass

func _process(_delta):
	if Global.edit and not spinbox.visible:
		# if show the num_UI:whenever old player or new player;
		# the UI come from Global.number:int and Global.the_text:str;
		# we can move Global.number and Global.the_text only.
		the_spin.get_line_edit().text = str(Global.number)
		namebox.text = Global.the_text
		spinbox.show()
	pass

func Spinbox_show():
	Global.edit = true
	Global.old_edit = 0
	Global.number = num
	Global.the_text = ""
	pass

# A_team button, it used to create new player.tscn.
func _on_A_team_pressed():
	color = A_team_color
	the_position = Vector2(100,90)
	if not Global.arrow:
		Spinbox_show()
	pass

# B_team button, like _on_A_team_pressed().
func _on_B_team_pressed():
	color = B_team_color
	the_position = Vector2(700,1300)
	if not Global.arrow:
		Spinbox_show()
	pass
	
# arrow checkbutton
## true is arrow mode
## false is station mode
func _on_arrow_toggled(button_pressed):
	Global.arrow = button_pressed
	pass


# maintain current state
func _on_retain_toggled(button_pressed):
	Global.retain = button_pressed
	pass
	
# save
func _on_save_pressed():
	if num_ma_in == 0:
		Ma_in.add_item("test",2)
		Global.pt("# create data {key} in Ma_in".format({key = "name"}))
	print(bool(Ma_in.get_item_text(2) == "test"))
	pass

# if the player will be delete, be red.
func _on_delete_pressed():
	if not Global.arrow:
		delete.modulate = Color(1,0,0,0.78)
		Global.clean = true
	pass

# drag here to delete the player.
func _on_delete_released():
	delete.modulate = Color(1, 1, 1, 1)
	Global.clean = false
	pass

# get the arrow(in arrow mode).
func _on_get_arrow_pressed():
	if Global.arrow and (not Global.move_arrow):
		var arrow = new_arrow.instance()
		arrow.position = get_global_mouse_position()
		add_child(arrow)
	pass


func _on_SpinBox_value_changed(value):
	num = value
	pass
	
func _on_nameBox_text_changed(new_text):
	the_name = new_text
	pass

func _on_Button_button_up():
	Global.edit = false
	spinbox.hide()
	if Global.old_edit == 0:
		get_player(the_spin.get_line_edit().text,the_position,namebox.text)
	else:
		change_player(the_spin.get_line_edit().text,namebox.text)
	pass
	
func get_player(the_num,tp,tn):
	var the_player = player.instance()
	the_player.the_color = color
	the_player.number = int(the_num)
	the_player.position = tp
	the_player.the_text = tn
	add_child(the_player)
	Global.pt("##### create a player name: {new_name} and num: {new_num}".format({
		new_name = tn,
		new_num = the_num
	}))
	pass
	
func change_player(the_num,tn):
	Global.the_text = tn
	Global.number = int(the_num)
	Global.change_rank = Global.old_edit
	pass
