extends Node

# game variables
var screen_size : Vector2i
var speed : float
var score : int
var game_running : bool

const SCORE_MODIFIER : int = 100
const PLAYER_START_POS := Vector2i(232, 768)
const CAM_START_POS := Vector2i(960, 520)
const START_SPEED : float = 1
const MAX_SPEED : int = 25
	
func _ready():
	screen_size = get_window().size
	new_game()

func new_game():
	score = 0
	show_score()
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
		score += speed
		show_score()
		
		# update ground position
		if $Camera2D.position.x - $Floor.position.x > screen_size.x * 1.5:
			$Floor.position.x += screen_size.x 
	else:
		if Input.is_action_pressed("jump"):
			game_running = true
			$HUD.get_node("PressToPlayLabel").hide()

func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score / SCORE_MODIFIER)
