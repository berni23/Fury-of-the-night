extends Node2D

#[Enemy]
var life_skeleton
var life_dragon


#[Initial_objects]

var coins

#[chapters]

var wave1
var wave2

#Creating config address
var vars_1 = "res://vars_1.cfg"
var config = ConfigFile.new()
var load_response = config.load(vars_1)


func _ready():
	
	life_skeleton =  config.get_value("Enemy","life_skeleton",life_skeleton)
	life_dragon   =  config.get_value("Enemy","life_dragon",life_dragon)
	
	coins = config.get_value("Initial_objects","coins",coins)
	

#func saveValue(section,key):
#
#	config.set_value(section,key,DisplayValue)
#	config.save(save_path)
#

