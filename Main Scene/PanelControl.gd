extends HBoxContainer

export (PackedScene) var towerIcon
export (PackedScene) var getCoins 
export (PackedScene) var BombIcon
export (PackedScene) var MudIcon
export (PackedScene) var TowerUp
export (PackedScene) var towerUpIcon
export (PackedScene) var TowerStepsIcon
export (PackedScene) var thunder
export (PackedScene) var thunderIcon


var Arr_up=[TowerUp]

var upgrade =0

	
func delete_existing_icons():
	get_tree().call_group(Groups.Icons,"queue_free")

func _on_CreateTower_pressed():

	delete_existing_icons()
	if upgrade==0:

			get_parent().add_child(towerIcon.instance())
			
		 
	elif upgrade ==1:
		get_parent().add_child(towerUpIcon.instance())
	
func _on_HoverCoins_pressed():
	delete_existing_icons()
	self.get_parent().add_child(getCoins.instance())
	
	
func _on_thunder_pressed():
	
	delete_existing_icons()

	if self.get_parent().Coins>=5:
		
		self.get_parent().add_Thunders(1)
		self.get_parent().add_Coins(-5)

func _on_Bomb_pressed():
	delete_existing_icons()

	if self.get_parent().Coins>=5:
		
		self.get_parent().add_Bombs(1)
		self.get_parent().add_Coins(-5)
		

		
func _input(event):
	
	
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_T and self.get_parent().Thunders>0:
			delete_existing_icons()
		
			self.get_parent().add_child(thunderIcon.instance())
	
	
	
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_B and self.get_parent().Bombs>0:
			delete_existing_icons()
		
			self.get_parent().add_child(BombIcon.instance())
			
		if event.scancode == KEY_M and self.get_parent().Mud>0:
			delete_existing_icons()
			
			self.get_parent().add_child(MudIcon.instance())
	

func _on_Mud_pressed():
	delete_existing_icons()
	if self.get_parent().Coins>=1:
			self.get_parent().add_Mud(1)
			self.get_parent().add_Coins(-1)


func _on_Upgrade_pressed():
	delete_existing_icons()
	upgrade =1
	
	for N in self.get_parent().get_node("YSortObjects").get_children():
	
		$Extras/Upgrade/TowerUp_sound.play()
		
		if N.is_in_group(Groups.Towers):
			
			if N.Up == true:
				
				var NewObj = TowerUp.instance()
				var TowerPos = N.global_position
				N.queue_free()
				NewObj.global_position =TowerPos
	
				self.get_parent().get_node("YSortObjects").add_child(NewObj)


func _on_Create_TowerStep_pressed():
	delete_existing_icons()
	self.get_parent().add_child(TowerStepsIcon.instance())
	