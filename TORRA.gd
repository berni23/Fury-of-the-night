extends Sprite

export(PackedScene) var bala
var speed_bala = 1400
var Reload = true
var Enemy_range = []
var Tower = true

func _ready():

	self.position = get_global_mouse_position()
	

func _on_Range_area_entered(area):
	
	if area.get("Tower"):
		
		return

	Enemy_range.append(area.get_parent())
	
func _on_Range_area_exited(area):
	Enemy_range.erase(area.get_parent())

func  _process(delta):
	
	if len(Enemy_range)==0 or Reload==false:
		
		return

	var Nbala = bala.instance()

	var vector_bala= (Enemy_range[0].position - self.position).normalized()
	
	Nbala.speed = vector_bala*speed_bala
	
	Nbala.t_life= get_node("Range/CollisionShape2D").shape.radius/speed_bala
	
	Reload=false
	
	self.add_child(Nbala)


func _on_Timer_timeout():
	
	Reload = true
 # replace with function body

