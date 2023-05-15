extends Node

var sqlite = preload('res://godot-sqlite/bin/gdsqlite.gdns')
var db
var arrow : bool = false
var clash : bool = false
var clean : bool = false
var move_arrow : bool = false
var retain : bool = true
var edit : bool
var new_edit : bool
var change_bool : bool = false

var the_text : String = ""
var number : int = 1

func _ready():
	the_theme(
		Color(0.4,0.4,0.4,1)
	)
	pass


# set UI's color 
func the_theme(background:Color):
	VisualServer.set_default_clear_color(background)
	pass

# sqlite	
func select(_table):
	db = sqlite.new()
	pass

func updata(_data):
	db = sqlite.new()
	pass

# write the log.md
func pt(data):
	print(data)
	pass
