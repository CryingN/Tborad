extends Node2D

onready var circle = $Button
onready var text = $name
onready var label = $number
onready var time = $Timer

var player_rank 
var change : bool = false
var the_text : String
var number : int = 233
var can_move : bool = false
var the_color : Color

func _ready():
	player_rank = Global.rank
	modulate = the_color
	label.text = str(number)
	text.text = the_text
	Global.rank += 1
	pass

# loop to use get point position.
func _process(_delta):
	if can_move:
		position = get_global_mouse_position()

	if Global.change_rank == player_rank:
		change_name_or_num()
	pass

# let player down
func _on_Button_pressed():
	if not (Global.clash or Global.arrow or Global.edit):
		can_move = true
		Global.clash = true
		modulate = the_color + Color(0.1,0.1,0.1,0)
		Global.pt("let {num} down".format({num = number}))

	pass

# up,up,up
func _on_Button_released():
	if Global.clash and (not (Global.arrow or Global.edit)):
		Global.clash = false
		can_move = false
		modulate = the_color
		Global.pt("let {num} up".format({num = number}))
		time.start()
		if change:
			Global.edit = true
			Global.old_edit = player_rank
			Global.number = int(label.text)
			Global.the_text = text.text
		change = true
		
		if Global.clean:
			queue_free()
			Global.clean = false
			Global.pt("{num} is free".format({num = number}))
		
	pass

func change_name_or_num():
	Global.pt("##### {num}-{the_name} move name: {new_name} and num: {new_num}".format({
		num = label.text, 
		the_name = text.text,
		new_name = Global.the_text,
		new_num = str(Global.number)
		}))
	label.text = str(Global.number)
	text.text = Global.the_text
	Global.change_rank = 0
	
	pass

func _on_Timer_timeout():
	change = false
	pass
