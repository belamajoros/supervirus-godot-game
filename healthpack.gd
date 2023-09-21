extends Area2D


func _on_healthpack_body_entered(body):
	queue_free()
