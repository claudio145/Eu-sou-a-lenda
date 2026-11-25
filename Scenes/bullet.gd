extends Area2D

var speed = 500.0
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	pass # Replace with function body.
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		return
	queue_free()
