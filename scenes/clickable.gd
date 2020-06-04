extends Sprite

export(Texture) var  open_sprite
export(Texture) var  closed_sprite 
	
export var is_open = false

signal clicked


func _ready():
	if is_open:
		self.set_texture(open_sprite)
	else:
		self.set_texture(closed_sprite)
	
	
func clicked():
	if is_open:
		print(self.name, " is closed !")
		self.set_texture(closed_sprite)
		is_open = false
	elif !is_open:
		print(self.name, " is open !")
		self.set_texture(open_sprite)
		is_open = true
