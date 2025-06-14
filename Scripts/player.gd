extends CharacterBody2D

# Auxiliar Variables
@export var _speed: int = 400
@onready var animated_sprite2d = $AnimatedSprite2D

# Movement Function
func Movement():
	# Get the input direction
	var moveDiretion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Animations Controller
	if moveDiretion.x == 0 and moveDiretion.y == 0:
		animated_sprite2d.play("idle")
	else:
		if moveDiretion.x > 0 or (moveDiretion.x > 0 and moveDiretion.y < 0):
			animated_sprite2d.flip_h = false
			animated_sprite2d.play("Run_Horizontal")
		elif moveDiretion.x < 0 or (moveDiretion.x < 0 and moveDiretion.y > 0):
			animated_sprite2d.flip_h = true
			animated_sprite2d.play("Run_Horizontal")
		
		if moveDiretion.y < 0 and moveDiretion.x == 0:
			animated_sprite2d.play("Run_Vertical_Up")
		elif moveDiretion.y > 0 and moveDiretion.x == 0:
			animated_sprite2d.play("Run_Vertical_Down")
			
	# Move Player
	velocity = moveDiretion*_speed
	move_and_slide()

# Main Loop
func _physics_process(delta: float):
	Movement()
