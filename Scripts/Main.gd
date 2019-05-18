extends Node

func _rafaga(Enemy,N_ene,t_ene,N_ole,t_ole):
	"""
	Retorna  N_ole conjunts de Enemy, amb N_ene unitats
	per conjunt, cada unitat separada un interval t_ene 
	i cada conjunt separat un temps t_ole
	
	Arguments
	
	Enemy: escena la qual conté l'enemic 
	N_ene: nombre d'enemics que es vol per oleada
	t_ene: temps concorregut entre cada enemic ( segons)
	N_ole: Nombre d'oleadas
	t_ole: temps entre oleada
	"""
	for i in range(0,N_ole):
		for j in range(0,N_ene):
			$Path2D.add_child(Enemy.instance())
			yield(get_tree().create_timer(t_ene),"timeout")
		yield(get_tree().create_timer(t_ole),"timeout")

func _ready():
	var skeleton = preload("res://Scenes/Skeleton.tscn")
	_rafaga(skeleton,3,1,1,1)