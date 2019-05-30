extends ProgressBar



func _on_EndPath_area_entered(area):
	var Life = self.value
	
	self.value = (Life-1)
#	self.get_parent().get_child('Status/Life').set_value(value - 1)

	if Life <=0:
		
		print('GAME OVER')
