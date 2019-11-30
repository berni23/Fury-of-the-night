extends TextureProgress

export (PackedScene) var filled

func _ready():
	pass


func _on_Chakra_value_changed(value):
	if self.value==self.max_value:
		self.add_child(filled.instance())
		
