extends Node

#About the reading and Writing on my file


func save_player (name, game_mode):
	# If the file existe => the game pass and popup dialog
	# If he doesn't => the game create one new
	var file = FileAccess.open("user://Save.dat", FileAccess.WRITE)
	
	file.store_line(name)
	file.store_line(game_mode)
	
	file.close()

func load_player():
	if !FileAccess.file_exists("user://Save.dat"):
		return
	
	var file = FileAccess.open("user://Save.dat", FileAccess.READ)
	
	var Player_Name = file.get_line()
	var Player_Mode = file.get_line()
	
	print(Player_Name)
	print(str(Player_Mode))
	
	file.close()
