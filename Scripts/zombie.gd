extends "res://Scripts/Karakterler.gd"

@onready var player = get_tree().get_root().get_node("player")
var takip_hizi = 100

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		hareket_et(direction)
		
		if global_position.distance_to(player.global_position) < 50:
			saldir()
		
func saldir():
	print("Dusman saldırısı")
	# Saldırı işlemleri burada tanımlanacak
