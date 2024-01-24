extends Node

# game variables
var screen_size : Vector2i
var speed : float
var distance : int
var game_running : bool

const DISTANCE_MODIFIER : int = 100
const PLAYER_START_POS := Vector2i(221, 904)
const CAM_START_POS := Vector2i(960, 520)
const START_SPEED : float = 1
const MAX_SPEED : int = 25
	
func _ready():
	screen_size = get_window().size
	new_game()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func new_game():
	distance = 0
	show_distance()
	# reset the nodes
	$Player.position = PLAYER_START_POS
	$Player.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$Floor.position = Vector2i(0, 0)
	
	# reset HUD
	$HUD.get_node("PressToPlayLabel").show()

func _process(delta):
	if game_running:
		speed = START_SPEED
		
		# move dino and camera
		$Player.position.x += speed
		$Camera2D.position.x += speed
		
		# update score
		distance += speed
		show_distance()
		
		# update ground position
		if $Camera2D.position.x - $Floor.position.x > screen_size.x * 1.5:
			$Floor.position.x += screen_size.x 
	else:
		if Input.is_action_pressed("jump"):
			game_running = true
			$HUD.get_node("PressToPlayLabel").hide()

func show_distance():
	$HUD.get_node("DistanceLabel").text = "DISTANCE: " + str(distance / DISTANCE_MODIFIER)
