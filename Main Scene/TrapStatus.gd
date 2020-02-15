extends HBoxContainer

func _ready():
	get_node('Traps1').add_constant_override("separation", 20)
	get_node('Traps2').add_constant_override("separation", 20)
	self.add_constant_override("separation",20)
	
	get_node("/root/GameMaster").connect("Bomb_changed",self,"_on_Main_Bomb_changed")
	get_node("/root/GameMaster").connect("Thunder_changed",self,"_on_Main_Thunder_changed")
	get_node("/root/GameMaster").connect("Shred_changed",self,"_on_Main_Shred_changed")
	get_node("/root/GameMaster").connect("Mud_changed",self,"_on_Main_Mud_changed")
	
func _on_Main_Bomb_changed(Bomb):
	self.get_node("Traps1/Bomb/BombCounter").text = str(Bomb)
func _on_Main_Thunder_changed(Thunder):
	self.get_node("Traps1/Thunder/ThunderCounter").text = str(Thunder)
func _on_Main_Shred_changed(Shred):
	self.get_node("Traps2/Shred/ShredCounter").text = str(Shred)
func _on_Main_Mud_changed(Mud):
	self.get_node("Traps2/Mud/MudCounter").text = str(Mud)

