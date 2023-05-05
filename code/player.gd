extends TouchScreenButton

onready var text = $name
onready var label = $number
onready var circle = $circle

var the_name
var the_color : Color

func _ready():
	the_name = "hahaha"
	#write_the_number(the_name)
	move_color(the_color)
	pass

func write_the_number(name):
	text.text = ""
	text.append_bbcode(
		"[center][b]{num}[/b][/center]".format({"num" : name})
	)

func move_color(color:Color):
	circle.modulate = color
	pass
