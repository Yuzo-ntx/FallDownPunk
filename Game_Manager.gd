extends Node

var PlayerName
var PlayerHealth
var PlayerMaxHealth
var PlayerShield
var PlayerMaxShield
var PlayerPower
var PlayerLevel
var PlayerSkin
var PlayerRank

func Player_Register(
	 Name,
	 Health,
	 MaxHealth,
	 Shield,
	 MaxShield,
	 Power,
	 Level,
	 PlayerColore,
	 Rank
	):
	
	var file = FileAccess.open("user://PlayerInformation", FileAccess.WRITE)
	
	file.store_line(Name)
	file.store_line(Level)
	file.store_line(PlayerColore)
	file.store_line(Rank)
	file.store_line(str(Health))
	file.store_line(str(MaxHealth))
	file.store_line(str(Shield))
	file.store_line(str(Power))
	file.store_line(str(MaxShield))
	
	PlayerName = Name
	PlayerHealth = Health
	PlayerMaxHealth = MaxHealth
	PlayerShield = Shield
	PlayerMaxShield = MaxHealth
	PlayerPower = Power
	PlayerRank = Rank
	PlayerLevel = Level
	PlayerSkin = PlayerColore
	
	print("Player Saved Successfull !")
	
	file.close()
	return


func Load_Player():
	
	var file = FileAccess.open("user://PlayerInformation", FileAccess.READ)
	
	PlayerName = file.get_line()
	PlayerHealth = file.get_line()
	PlayerMaxHealth = file.get_line()
	PlayerShield = file.get_line()
	PlayerMaxShield = file.get_line()
	PlayerPower = file.get_line()
	PlayerLevel = file.get_line()
	PlayerSkin = file.get_line
	PlayerRank = file.get_line()
	
	file.close()


func PlayerInformation():
	if !FileAccess.file_exists("user://PlayerInformation"):
		print("Player doesn't exist yet!")
		return
	Load_Player()
	
	print("Player Name: ", PlayerName)
	print("Player Health: " + str(PlayerHealth))
	print("Player Level: " + str(PlayerLevel))
	print("Player Rank" + str(PlayerRank))
	print("Player Skin" , PlayerSkin)



func PlayerTakeDamage(Damage):
	PlayerHealth -= Damage
	return
