extends Node

# all time
var total_distance
var total_score
var total_jumps
var total_games

# best runs
var longest_distance = 0
var highest_score = 0

# signal handler

func _on_update_jump_statistic():
	total_jumps += 1
	print("Statistic total_jumps updated")
