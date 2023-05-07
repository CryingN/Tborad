extends Node2D

onready var circle = $Button
onready var text = $name
onready var label = $number

var number : int = 233
var can_move : bool = false
var the_color : Color

func _ready():
	modulate = the_color
	label.text = str(number)
	print("new")
	pass

# write the player's name
func write_the_name(name):
	text.text = ""
	text.append_bbcode(
		"[center][b]{num}[/b][/center]".format({"num" : name})
	)

# loop to use get point position.
func _process(_delta):
	if can_move:
		position = get_global_mouse_position()	
	pass

# let player down
func _on_Button_pressed():
	if not Global.clash and Global.station:
		can_move = true
		Global.clash = true
		modulate = the_color + Color(0.1,0.1,0.1,0)
		Global.pt("let {num} down".format({num = number}))
	pass

# up,up,up
func _on_Button_released():
	if Global.clash and Global.station:
		Global.clash = false
		can_move = false
		modulate = the_color
		Global.pt("let {num} up".format({num = number}))
		print(Global.clean)
		if Global.clean:
			queue_free()
			Global.clean = false
			Global.pt("{num} is free".format({num = number}))
	pass

