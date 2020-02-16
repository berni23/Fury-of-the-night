extends Node2D

export (PackedScene) var power1
export (PackedScene) var power2
export (PackedScene) var power3

var c =0

func _ready():
	pass
	
	#Nota : relacionar els texturebuttons amb el concepte de 'icon'. quan cliquis a un altre icon o click dret, desapareguin,
	#i ique també es desconectin


#	#self.position =Vector2(get_parent().margin_right/2,get_parent().margin_bottom/2)
#	#self.position = Vector2(get_parent().position.x,get_parent().position.y)
	#$TextureButton.disabled
	
func _process(delta):
	c+= delta  
	self.get_node('Button').set_modulate(Color(0,sin(5*c)*sin(5*c),0))

func _on_Button_pressed():
	
	$TextureButton.show()
	$TextureButton2.show()
	$TextureButton3.show()
	$TextureButton4.show()

	$TextureButton.connect("pressed", self, "_on_TextureButton_pressed")
	$TextureButton2.connect("pressed", self, "_on_TextureButton2_pressed")
	$TextureButton3.connect("pressed", self, "_on_TextureButton3_pressed")
	$TextureButton4.connect("pressed", self, "_on_TextureButton4_pressed")


func _on_TextureButton_pressed():
	get_parent().value = 0
	get_parent().get_parent().add_child(power1.instance())
	self.queue_free()
	
func _on_TextureButton2_pressed():
	get_parent().value = 0
	get_parent().get_parent().add_child(power2.instance())
	self.queue_free()
	
func _on_TextureButton3_pressed():
	get_parent().value = 0
	get_parent().get_parent().add_child(power3.instance())
	self.queue_free()

#func _on_TextureButton4_pressed():
#	$Label.set_text('Power 4')

func _on_TextureButton_mouse_entered():
	$Label.set_text('Power 1')
func _on_TextureButton2_mouse_entered():
	$Label.set_text('Power 2')
func _on_TextureButton3_mouse_entered():
	$Label.set_text('Power 3')
func _on_TextureButton4_mouse_entered():
	$Label.set_text('Power 4')
