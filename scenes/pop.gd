extends Sprite

export var zoom_coef = Vector2(1.2, 1.2)
var initial_scale = null

func _ready():
	initial_scale = self.scale


func pop_up():
	self.scale = initial_scale * zoom_coef
	
func pop_down():
	self.scale = initial_scale
