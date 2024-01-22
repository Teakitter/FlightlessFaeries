extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1800

# Called every frame.
func _physics_process(delta):
	velocity.y += GRAVITY + delta
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_SPEED
			# $JumpSound.play()
		#elif Input.is_action_pressed("duck"):
			#$AnimatedSprite2D.play("duck")
		#else:
			#$AnimatedSprite2D.play("run")
	#else:
		#$animatedSprite2D.play("jump")
	
	move_and_slide()
