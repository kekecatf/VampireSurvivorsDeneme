extends "res://Scripts/Karakterler.gd"

@onready var sprite = $AnimatedSprite2D
@onready var hitbox = $Hitbox/HitboxAlan
@onready var enemy = get_parent().get_node("enemy")
var vuruyormu = false

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	hareket_et(direction)
	
	if vuruyormu == false:
		sprite.play("Walk")
	
	if direction == Vector2.ZERO and vuruyormu == false:
		sprite.play("Idle")
		
	if Input.is_action_just_pressed("Attack"):
		vuruyormu = true
		hitbox.disabled = false
		sprite.play("Attack")
		
	if Input.is_action_just_pressed("Heavy_Attack"):
		vuruyormu = true
		sprite.play("Charge_Heavy_Attack")
		
	if Input.is_action_just_released("Heavy_Attack"):
		vuruyormu = true
		hitbox.disabled = false
		sprite.play("Heavy_Attack")
		
func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "Attack" or sprite.animation == "Heavy_Attack":
		vuruyormu = false
		hitbox.disabled = true

func _on_hitbox_body_entered(body):
	if body.name == "enemy":
		var enemy_sprite = body.get_node("AnimatedSprite2D")
		if enemy_sprite:
			enemy_sprite.play("Death")
