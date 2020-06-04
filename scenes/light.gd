extends Light2D

export(Texture) var  on_sprite
export(Texture) var  off_sprite 
	
var is_switched_on = false

var sprite = null
var light = null
signal switched


func _ready():
	sprite = self.get_parent().get_node("Sprite")
	light = self.get_parent().get_node("Light2D")
	
	if light.enabled:
		sprite.set_texture(on_sprite)
	else:
		sprite.set_texture(off_sprite)

	print("Light parent : ", sprite.name)
	print("Light ready !")
	
	
func switch():
	if is_switched_on:
		print(self.name, " is switched off !")
		sprite.set_texture(off_sprite)
		self.set_enabled(false)
		is_switched_on = false
	elif !is_switched_on:
		print(self.name, " is switched on !")
		self.set_enabled(true)
		sprite.set_texture(on_sprite)
		is_switched_on = true
