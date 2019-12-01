extends Node2D


export (PackedScene) var thunder

var posx =[422,390,390,693,716,716,724,724,539,536,377,91]
var posy = [109,98,98,98,161,158,213,214,521,520,523,436]

var stormx = [1024,121,235,330,441,500,588,649,710,717,719,718,655,604,526,459,389,351,282,244,190,124,94,87,77,72,78,91,143,187,283,329,381,419,480,527,592,647,720,751,802,833,871,934,937,949,949,954,953,953,952,955,956,970,973,990,1002]
var stormy = [672,111,110,112,107,109,107,113,162,200,277,315,336,332,331,331,329,333,331,333,332,331,347,371,426,454,500,519,527,532,526,530,533,533,532,525,519,518,515,510,468,456,451,424,422,385,377,331,324,287,272,225,220,204,204,202,202]

var c =0
var d = 0
var fade = false
var control = true
func _ready():
	
	$Particles2D.hide()
	$Leave.show()
	$rain.stop()
	$wind.play()
	


func _on_Timerwind_timeout():
	
	$wind.volume_db+=5
	$Particles2D.show()
	$Particles2D.amount =200
	$rain.play()
	$Timer.start()

func _on_Timer_timeout():
	
	$wind.volume_db-=5
	$Particles2D.amount=2000
	$rain.volume_db+=10
	yield(get_tree().create_timer(5),"timeout")
	$Leave.hide()
	$wind.volume_db-=2
	control = false
	
	for i in range(0,len(stormx)):
        var bang = thunder.instance()
        bang.set_position(Vector2(stormx[i],stormy[i]))
        get_parent().add_child(bang)
        yield(get_tree().create_timer(0.1),"timeout")
    
	$rain.volume_db-=5
	$wind.volume_db-=4
	fade = true
	yield(get_tree().create_timer(5),"timeout")
	$TimerFewRain.start()
	$wind.volume_db-=4
	$rain.volume_db-=5
	$Particles2D.amount =200
	
func _on_rain_finished():
		$rain.play()


func _on_TimerFewRain_timeout():
	self.queue_free()

func _process(delta):
	if control ==true:
		c +=0.045*delta
		$Control.modulate = Color(1-c,1-c,1-c,c)
		$Control2.modulate = Color(1-c,1-c,1-c,c)
	elif fade ==true :
		d += 0.045*delta
		$Control.modulate = Color(1-c+d,1-c+d,1-c+d,c-d)
		$Control2.modulate = Color(1-c+d,1-c+d,1-c+d,c-d)
		
		