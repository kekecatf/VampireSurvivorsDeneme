extends CharacterBody2D

@onready var player = get_parent().get_node("player")
@onready var sprite = $AnimatedSprite2D
var speed = 100.0  # put wanted speed here

func _physics_process(delta):
	if player:  # Ensure player exists
		look_at(player.global_position)
		var direction = (player.global_position - global_position).normalized()
		var velocity = direction * speed * delta
		position += velocity


func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "Death":
		queue_free()
