extends PathFollow2D

export(int) var speed = 110

func _process(delta):
	
	self.offset += speed*delta

	


