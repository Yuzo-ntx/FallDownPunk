extends ConfirmationDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var data = GlobalScript.load_player()
	if FileAccess.file_exists("user://Save.dat"):
		print("Player Found !")
		start_game()
		data
	else:
		print("First time to open the game!")
# Called every frame 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	pass


# the game starts => if the file Save doesn't existe => show dialog
	# => The player enter his name and game_mode => Create a save File

func _on_confirmed() -> void:
	if %NameEdit.text.strip_edges() == "" and %TypeOption.selected == -1:
		show_error("The Player must Enter is Name and choose a mode")
		return
		
	if %NameEdit.text.strip_edges() == "" :
		show_error("The Player must Enter is Name")
		return
		
	if %TypeOption.selected == -1:
		show_error( %NameEdit.text + " you must choose a mode 😁")
		return
	
	show_confirmation("Great! Welcome " 
	+ %NameEdit.text +
	"! to my game wish you good game in the " 
	+ %TypeOption.get_item_text(%TypeOption.selected) + " mode
	Ejoy your GAME! By The WAYYYYY😆✨")
	
	if !FileAccess.file_exists("user://Save.dat"):
		GlobalScript.save_player(%NameEdit.text, %TypeOption.get_item_text(%TypeOption.selected))
	




func _on_canceled() -> void:
	get_tree().current_scene.get_tree().quit()

func delete_all_data():
	Confirme_deleted("All your data would be deleted are you sure to continue ?")


func show_error(message):
	$Error.dialog_text = message
	$Error.popup_centered()

func Confirme_deleted(message):
	$Alert.dialog_text = message
	$Alert.popup_centered()
	
func show_confirmation(message):
	$Youpii.dialog_text = message
	$Youpii.popup_centered()

func _on_youpii_confirmed() -> void:
	#start_game()
	return

func start_game():
	get_tree().change_scene_to_file("res://scene/Main/Level/uie.tscn")

func _on_alert_confirmed() -> void:
	if FileAccess.file_exists("user://Save.dat"):
		DirAccess.remove_absolute("user://Save.dat")
	FileAccess.file_exists("user://Save.dat")
	print("Deleted successful!")


func _on_button_pressed() -> void:
	delete_all_data()
