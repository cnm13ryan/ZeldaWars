class_name Key extends Pickup
	
func body_entered(body: Node2D) -> void:
	if body.name == 'player' and GameState.keys < 9:
		GameState.keys += 1
	queue_free()
