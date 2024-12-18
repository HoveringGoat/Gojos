extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -900.0
const DECCELERATION = 50
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


var gravity = ProjectSettings.get_setting("physics/2d/deafault_gravity")


func _physics_process(delta: float) -> void:
	if (velocity.x > 1 || velocity.x < -1):
		if Input.is_action_pressed("run"):
			sprite_2d.animation = "running"
		else:
			sprite_2d.animation = "walking"
	else:
		sprite_2d.animation = "standing"  
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "jumping"
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		if Input.is_action_pressed("run"):
			velocity.x = SPEED
			velocity.x = velocity.x * direction * 2
		else:
			velocity.x = SPEED
			velocity.x = velocity.x * direction
	else:
		velocity.x = move_toward(velocity.x, 0, DECCELERATION       )

	move_and_slide()

	var isLeft = velocity.x < 0
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.flip_h = isLeft
