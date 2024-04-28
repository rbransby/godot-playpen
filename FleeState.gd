extends State

@export var flee_distance : float = 6.0

func enter():
	super.enter()
	controller.is_running = true
	flee()
	
func exit():
	super.exit()
	controller.is_running = false
	
func flee():
	var player_dir = (controller.position - controller.player.position).normalized()
	var move_pos = controller.position + (player_dir * flee_distance)
	controller.move_to_position(move_pos)
	
func navigation_complete():
	state_machine.change_state("Wander")
