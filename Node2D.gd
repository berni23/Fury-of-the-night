extends Node2D


var c =0

func _ready():
	
	#Nota : relacionar els texturebuttons amb el concepte de 'icon'. quan cliquis a un altre icon o click dret, desapareguin,
	#i ique també es desconectin
	 $Label.hide()
	


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
   
	print('p1')
	$Label.set_text('Power 1')
	$Label.show()
func _on_TextureButton2_pressed():
	
	print('p2')
	$Label.set_text('Power 2')
	$Label.show()
func _on_TextureButton3_pressed():
	
	print('p3')
	$Label.set_text('Power 3')
	$Label.show()
	
	
func _on_TextureButton4_pressed():

	print('p4')
	$Label.set_text('Power 4')
	$Label.show()

