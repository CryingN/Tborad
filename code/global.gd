extends Node

#var sqlite = preload('res://sqlite/bin/gdsqlite.gdns')
#var db
var station : bool = true
var clash : bool = false
var clean : bool = false

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
#func select(table):
#	db = sqlite.new()
#	pass

#func updata(data):
#	db = sqlite.new()
#	db.pop()
#	pass

# write the log.md
func pt(data):
	print(data)
	pass
