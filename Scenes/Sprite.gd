extends Sprite
#
#var Frame = 0
#var Frame_0 =0
##var HP_sprites= list_files_in_directory('res://Assets/HP')  # Convert to lower case
#
#var Names =['HP1.png',
#'HP2.png',
#'HP3.png',
#'HP4.png',
#'HP5.png',
#'HP6.png',
#'HP7.png',
#'HP8.png',
#'HP9.png',
#'HP10.png',
#'HP11.png',
#'HP12.png',
#'HP13.png',
#'HP14.png',
#'HP15.png',
#'HP16.png',
#'HP17.png',
#'HP18.png',
#'HP19.png',
#'HP20.png',
#'HP21.png',
#'HP22.png',
#'HP23.png',
#'HP24.png',
#'HP25.png',
#'HP26.png',
#'HP27.png',
#'HP28.png',
#'HP29.png',
#'HP30.png',
#'HP31.png',
#'HP32.png',
#'HP33.png',
#'HP34.png',
#'HP35.png',
#'HP36.png',
#'HP37.png',
#'HP38.png',
#'HP39.png',
#'HP40.png',
#'HP41.png',
#'HP42.png',
#'HP43.png',
#'HP44.png',
#'HP45.png',
#'HP46.png',
#'HP47.png',
#'HP48.png',
#'HP49.png',
#'HP50.png',
#'HP51.png',
#'HP52.png',
#'HP53.png',
#'HP54.png',
#'HP55.png',
#'HP56.png',
#'HP57.png',
#'HP58.png',
#'HP59.png',
#'HP60.png',
#'HP61.png',
#'HP62.png',
#'HP63.png',
#'HP64.png',
#'HP65.png',
#'HP66.png',
#'HP67.png',
#'HP68.png',
#'HP69.png',
#'HP70.png']
#
#
##func list_files_in_directory(path):
##    var files = []
##    var dir = Directory.new()
##    dir.open(path)
##    dir.list_dir_begin()
##
##
##    while true:
##        var file = dir.get_next()
##        files.appendfile)
##
##    dir.list_dir_end()
##
##    return files
#
#func _ready():
#
#	self.set_texture(load('res://Assets/HP'+ str(Names[0])))
#
#
#
#
#func _process_delta():
#
#
#	Frame =self.get_parent().life_ini-self.get_parent().lifeBar
#
#
#	if Frame == Frame_0:
#
#		return
#
#	else:
#		var NewFrame = load('res://Assets/HP'+ str(Names[Frame]))
#		self.set_texture(NewFrame)
#		self.global_position = Vector2(600,12)
#		Frame_0 = Frame
