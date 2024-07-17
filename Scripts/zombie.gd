extends CharacterBody2D

@onready var player = get_parent().get_node("player")

var speed = 100.0  # put wanted speed here

func _physics_process(delta):
	if player:  # Ensure player exists
		look_at(player.global_position)
		var direction = (player.global_position - global_position).normalized()
		var velocity = direction * speed * delta
		position += velocity
