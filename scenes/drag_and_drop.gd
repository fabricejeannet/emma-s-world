extends RigidBody2D

signal pressed
signal clicked
signal released

var held = false
var initial_mouse_position = null
var delta_x  = 0
var delta_y = 0

var sprite = null

func _ready():
	sprite = self.get_node("Sprite")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				emit_signal("pressed")
			elif !event.pressed:
				emit_signal("released")
				if get_global_mouse_position().is_equal_approx(initial_mouse_position):
					emit_signal("clicked")
				drop(Input.get_last_mouse_speed())


func _physics_process(delta):
	if held:
		var mouse_position = get_global_mouse_position()			
		var new_origin =  Vector2(mouse_position.x + delta_x, mouse_position.y + delta_y)
		global_transform.origin = new_origin
	
func pickup():
	if !held:	
		print(self.name, " picked up")
		var center_of_mass = global_transform.origin 
		initial_mouse_position = get_global_mouse_position() 
		delta_x = center_of_mass.x - initial_mouse_position.x 
		delta_y = center_of_mass.y - initial_mouse_position.y
		mode = RigidBody2D.MODE_STATIC
		held = true

func drop(impulse=Vector2.ZERO):
	if held:
		print(self.name, " dropped")
		mode = RigidBody2D.MODE_RIGID
		impulse.clamped(0.5)
#		apply_central_impulse(impulse)
		held = false
	
	
func clicked():
	print(self.name, " clicked")
