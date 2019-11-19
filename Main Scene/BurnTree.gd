extends Area2D
var broken = false
func _ready():
	
	self.add_to_group(Groups.BrokenStuff)

func _on_BurnTree_area_entered(area):
		if area.get_parent().is_in_group(Groups.Projectiles) and broken ==false:
			yield(get_tree().create_timer(1.0),"timeout")
			get_parent().get_node('Decoration').set_cellv(Vector2(27,11),-1,-1)
			get_node('fireTree').visible = true
			get_node('fireTree').play()
			yield(get_tree().create_timer(12),"timeout")
			get_node("brokenTree").visible = true
			get_node("fireTree").stop()
			get_node("fireTree").visible =false
			broken =true
