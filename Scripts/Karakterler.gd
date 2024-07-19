extends CharacterBody2D

# Ortak özellikler
var can = 100
var hiz = 200

# Ortak işlevler
func hareket_et(direction: Vector2):
	velocity = direction * hiz
	move_and_slide()

func can_azalt(deger: int):
	can -= deger
	if can <= 0:
		ol()

func ol():
	queue_free()

func saldir():
	pass  # Türeyen sınıflarda spesifik saldırı davranışı tanımlanacak
