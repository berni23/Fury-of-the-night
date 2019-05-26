extends Area2D

func _on_EndPath_area_entered(enemy):
	
	""" Function que elimina els enemics si 
	finalitzen el recorregut"""
#
#	if enemy.is_in_group(Groups.Enemies):
		
		
	enemy.get_parent().queue_free()
	self.get_parent().lifeBar =self.get_parent().lifeBar-1
	
	print(self.get_parent().lifeBar)
		
	if self.get_parent().lifeBar==0:
		
		print('GameOver')