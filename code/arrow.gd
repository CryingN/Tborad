extends Polygon2D

onready var start = $start
onready var end = $end
onready var time = $Timer
onready var utd = $used_to_delete

var start_key : bool
var end_key : bool
var delete : bool
var vector : Vector2
const min_vec = 1

func _ready():
	end_key = true
	start_key = false
	delete = false
	Global.pt("**create a arrow**")
	pass


func _process(_delta):
	if min_vec > scale.y and not end_key:
		queue_free()
		Global.pt("**delete a too small arrow**")
		
	if not Global.arrow:
		if Global.edit:
			start.hide()
			end.hide()
			delete = false
		if not Global.retain:
			queue_free()
			Global.pt("**delete all arrow**")
	else:
		start.show()
		end.show()
	
	# end 端移动
	if end_key:
		vector = position - get_global_mouse_position()
		scale.y = vector.length() / 50
		rotation_degrees = (vector.angle() * 180 / PI) - 90
	elif start_key:
		position = get_global_mouse_position()
	pass

func _on_end_pressed():
	Global.move_arrow = true
	end_key = true
	start.hide()
	pass

func _on_end_released():
	Global.move_arrow = false
	end_key = false
	start.show()
	pass

func _on_start_pressed():
	Global.move_arrow = true
	end.hide()
	start_key = true
	pass

func _on_start_released():
	Global.move_arrow = false
	end.show()
	start_key = false
	pass

func _on_Timer_timeout():
	delete = false
	pass

func _on_used_to_delete_released():
	time.start()
	if Global.arrow and delete:
		queue_free()
		Global.pt("**delete a arrow**")
	delete = true
	pass
