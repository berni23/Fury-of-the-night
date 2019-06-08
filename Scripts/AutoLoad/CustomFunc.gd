extends Node

static func distance_to_path(p,path):
	""" Funcio que calcula la distancia minima d'un punt p a un
	path. Assumeix que el path esta format per segments rectes.
	Funcionara igualment amb un path curvat, pero estara aproximat com
	segments entre els punts. Seria facil millorar-ho, usant funcions
	de Curve2D, pero ara no cal """
	var curve = path.get_curve()
	var distance = float(1e10)
	var aux
	for i in range(0,curve.get_point_count()-1):
		aux = distance_to_segment(p,curve.get_point_position(i),curve.get_point_position(i+1))
		if aux < distance:
			distance = aux
	return distance

static func distance_to_segment(p,p1,p2):
	""" Funcio que calcula la distancia del punt p 
	al segment delimitat per p1 i p2. Inspirat en
	https://math.stackexchange.com/questions/330269/the-distance-from-a-point-to-a-line-segment """
	var t = ((p-p1).dot(p2-p1))/p1.distance_squared_to(p2)
	# Until now we just projected to a point in the line, next we restrict to segment
	t = min(max(0,t),1)
	# Now t gives the closest point to p that is in the segment
	var closest = p1 + t*(p2-p1)
	return (p-closest).length()
	
static func snap_to_grid(p,grid_vector,offset_vector=Vector2(0,0)):
	""" Aquesta funcio fa el mateix que Vector2D.snapped, pero permet
	afegir un parametre de offset """
	var x = round((p.x-offset_vector.x)/grid_vector.x)*grid_vector.x
	var y = round((p.y-offset_vector.y)/grid_vector.y)*grid_vector.y
	return Vector2(x,y) + offset_vector