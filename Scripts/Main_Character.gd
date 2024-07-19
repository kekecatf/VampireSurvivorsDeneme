extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var hitbox = $Hitbox/HitboxAlan
@onready var enemy = get_parent().get_node("enemy")
var speed = 400
var vuruyormu = false

func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	var direction:Vector2 = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	if vuruyormu == false:
		sprite.play("Walk")
	
	if direction == Vector2(0,0) and vuruyormu == false:
		sprite.play("Idle")
		
	if Input.is_action_just_pressed("Attack"):
		print("saldirildi")
		vuruyormu = true
		hitbox.disabled = false
		sprite.play("Attack")
		
	if Input.is_action_just_pressed("Heavy_Attack"):
		print("şarjlı ağır saldırı")
		vuruyormu = true
		sprite.play("Charge_Heavy_Attack")
	if Input.is_action_just_released("Heavy_Attack"):
		print("ağır saldırı")
		vuruyormu = true
		hitbox.disabled = false
		sprite.play("Heavy_Attack")
	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "Attack" or "Heavy_Attack":
		vuruyormu = false
		hitbox.disabled = true


func _on_hitbox_body_entered(body):
	if body.name == "enemy":
		print("dusman")
		var enemy_sprite = body.get_node("$AnimatedSprite2D")
		if enemy_sprite:
			enemy_sprite.play("Death")
			print("oldu")
			
