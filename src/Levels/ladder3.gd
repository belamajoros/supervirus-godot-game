extends TileMap


func _on_ladder_body_entered(body):
	if body.name == "Player":
		get_node("/root/Level1/Player").ladder_on = true


func _on_ladder_body_exited(body):
	if body.name == "Player":
		get_node("/root/Level1/Player").ladder_on = false


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "Player":
		get_node("/root/Level1/Player").ladder_on = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		get_node("/root/Level1/Player").ladder_on = false
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_node("/root/Level1/Player").ladder_on = true
