extends HBoxContainer

export (PackedScene) var ShredIcon
export (PackedScene) var BombIcon
export (PackedScene) var MudIcon
export (PackedScene) var TowerUpIcon
export (PackedScene) var TowerStepsIcon
export (PackedScene) var ThunderIcon
export (PackedScene) var TowerIcon
export (PackedScene) var TowerUp
export (PackedScene) var getCoins 
export (PackedScene) var Friend
var Arr_up=[TowerUp]

var upgrade =0


func delete_existing_icons():
	get_tree().call_group(Groups.Icons,"queue_free")

func _on_CreateTower_pressed():

	delete_existing_icons()
	if upgrade==0:
			get_parent().add_child(TowerIcon.instance())
	elif upgrade ==1:
		get_parent().add_child(TowerUpIcon.instance())

func _on_HoverCoins_pressed():
	delete_existing_icons()
	self.get_parent().add_child(getCoins.instance())


func _on_thunder_pressed():
	delete_existing_icons()

	if self.get_parent().Coins>=5:
		
		self.get_parent().add_Thunder(1)
		self.get_parent().add_Coins(-5)

func _on_Bomb_pressed():
	delete_existing_icons()
	if self.get_parent().Coins>=5:
		
		self.get_parent().add_Bomb(1)
		self.get_parent().add_Coins(-5)
		
func _on_Mud_pressed():
	delete_existing_icons()
	if self.get_parent().Coins>=1:
			self.get_parent().add_Mud(1)
			self.get_parent().add_Coins(-1)		

func _on_Shred_pressed():
		
	if self.get_parent().Coins>=5:
			self.get_parent().add_Shred(1)
			self.get_parent().add_Coins(-5)
	

func _on_Upgrade_pressed():
	delete_existing_icons()
	upgrade=1
	
	for N in self.get_parent().get_node("YSortObjects").get_children():
	
		$Extras/Upgrade/TowerUp_sound.play()
		
		if N.is_in_group(Groups.Towers):
			
			if N.Up==true:
				
				var NewObj = TowerUp.instance()
				var TowerPos = N.global_position
				N.queue_free()
				NewObj.global_position =TowerPos
	
				self.get_parent().get_node("YSortObjects").add_child(NewObj)

func _on_Create_TowerStep_pressed():
	delete_existing_icons()
	self.get_parent().add_child(TowerStepsIcon.instance())

func _on_Warrior_pressed():
	delete_existing_icons()
	
	get_parent().get_node('WarriorPath').add_child(Friend.instance())
	get_parent().add_Coins(-2)


func _input(event):
	if event is InputEventKey and event.pressed:
	
		if event.scancode == KEY_T:
			delete_existing_icons()
		
			self.get_parent().add_child(ThunderIcon.instance())
			
		if event.scancode ==KEY_S:
			
			delete_existing_icons()
		
			self.get_parent().add_child(ShredIcon.instance())
	
		if event.scancode == KEY_B:
			delete_existing_icons()
		
			self.get_parent().add_child(BombIcon.instance())
			
		if event.scancode == KEY_M:
			delete_existing_icons()
	
			self.get_parent().add_child(MudIcon.instance())
		
		if event.scancode == KEY_H:
			delete_existing_icons()
			self.get_parent().add_child(getCoins.instance())
			