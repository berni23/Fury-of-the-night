extends PathFollow2D

var seconds
var moving = true

func _ready():
	seconds = get_parent().animation_seconds

func _process(delta):
	if not moving:
		return
	# crec que es mes facil decidir els segons que la velocitat
	if unit_offset + delta/seconds < 1:
		self.unit_offset += delta/seconds
	else:
		unit_offset = 0.99
		moving = false


