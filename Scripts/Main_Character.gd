extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
var speed = 400  # speed in pixels/sec
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
		sprite.play("Attack")
	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	pass # Replace with function body.
