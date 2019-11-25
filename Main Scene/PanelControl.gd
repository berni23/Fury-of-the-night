extends HBoxContainer

export (PackedScene) var ShredIcon
export (PackedScene) var BombIcon
export (PackedScene) var MudIcon
export (PackedScene) var TowerUpIcon
export (PackedScene) var TowerStepsIcon
export (PackedScene) var ThunderIcon
export (PackedScene) var TowerIcon
export (PackedScene) var TowerFinIcon
export (PackedScene) var TowerUp
export (PackedScene) var getCoins 
export (PackedScene) var Friend
export (PackedScene) var Cargando

export (Image) var ImageT1
export (Image) var ImageT2

var upgrade =0
var PriceUp1 = 30
var PriceUp2 = 50
var PriceThunder =10
var PriceMud =2
var PriceBomb =5
var PriceShred =6
var PriceFriend = 5

func delete_existing_icons():
	get_tree().call_group(Groups.Icons,"queue_free")

func _on_CreateTower_pressed():
	delete_existing_icons()
	
	if upgrade==0:     get_parent().add_child(TowerIcon.instance())
	elif upgrade==1:   get_parent().add_child(TowerUpIcon.instance())	
	elif upgrade==2:   get_parent().add_child(TowerFinIcon.instance())
	
func _on_HoverCoins_pressed():
	delete_existing_icons()
	self.get_parent().add_child(getCoins.instance())

func _on_thunder_pressed():
	delete_existing_icons()

	if self.get_parent().Coins>=PriceThunder:
		self.get_parent().add_Thunder(1)
		self.get_parent().add_Coins(-PriceThunder)

func _on_Bomb_pressed():
	delete_existing_icons()
	if self.get_parent().Coins>=PriceBomb:
		
		self.get_parent().add_Bomb(1)
		self.get_parent().add_Coins(-PriceBomb)
		
func _on_Mud_pressed():
	delete_existing_icons()
	if self.get_parent().Coins>=PriceMud:
			self.get_parent().add_Mud(1)
			self.get_parent().add_Coins(-PriceMud)		

func _on_Shred_pressed():
	if self.get_parent().Coins>=PriceShred:
			self.get_parent().add_Shred(1)
			self.get_parent().add_Coins(-PriceShred)
	
func _on_Upgrade_pressed():
	delete_existing_icons()
	
	if upgrade==0 and get_parent().Coins>=PriceUp1:
		
		get_parent().add([-PriceUp1,"coins"])
		$Extras/Upgrade.disabled=true
		var wait = Cargando.instance()
		self.get_node("Extras/Upgrade").add_child(wait)
		wait.connect('animation_finished',self,'up',[1])

	elif upgrade ==1 and get_parent().Coins>=PriceUp2:	
		get_parent().add([-PriceUp2,"coins"])
		$Extras/Upgrade.disabled=true
		var wait = Cargando.instance()
		self.get_node("Extras/Upgrade").add_child(wait)
		wait.connect('animation_finished',self,'up',[2])

func _on_Create_TowerStep_pressed():
	delete_existing_icons()
	self.get_parent().add_child(TowerStepsIcon.instance())

func _on_Warrior_pressed():
	delete_existing_icons()
	
	if self.get_parent().Coins>=PriceFriend:
		get_parent().get_node('WarriorPath').add_child(Friend.instance())
		get_parent().add([-PriceFriend,"coins"])

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
			
func up(val):
	var string
	if val==1:
		string ='U'
		$Towers/CreateTower.icon = ImageT1
		
	elif val==2:	
		string ='F'
		$Towers/CreateTower.icon = ImageT2
					
	for N in get_tree().get_nodes_in_group(Groups.Towers):
		if  N.next==string:  N.Upgrade()
	
	upgrade = val
	delete_existing_icons()
	$Extras/Upgrade.disabled=false
	$Extras/Upgrade/TowerUp_sound.play()
	
	