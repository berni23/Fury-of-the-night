extends Sprite

export (float) var shadow_on_land = 0.3
var factor = 1
var original_scale
var seconds

func _ready():
	original_scale = scale
	seconds = get_parent().animation_seconds

func _process(delta):
	factor -= delta/seconds*(1-shadow_on_land)
	scale = original_scale*factor
	if factor <= shadow_on_land:
		self.queue_free()
