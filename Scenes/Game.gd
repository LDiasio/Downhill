extends Node

# Prefabs
onready var obstacle = preload("res://Scenes/Obstacle.tscn")
onready var flag = preload("res://Scenes/Flag.tscn")

# Nodes
onready var mountain = $Bodies
onready var bodies = $Bodies/YSort
onready var flags = $Bodies/Flags

# Timers
onready var obstacles_timer = $Timers/SpawnObstacleTimer

# Parameters
var global_speed = 100
var slope = 10

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	randomize()
	mountain.rotation_degrees = slope
	
#func _process(delta):
#	obstacles_timer.wait_time = 1 * (global_speed / 100)

func _on_SpawnObstacleTimer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var new_obstacle = obstacle.instance()
	new_obstacle.position.x = 384
	new_obstacle.position.y = rand_range(32, 148)
	bodies.add_child(new_obstacle)
	new_obstacle.owner = bodies
	
	var new_flag = flag.instance()
	new_flag.position.x = 384
	new_flag.position.y = 4
	flags.add_child(new_flag)
	new_flag.owner = flags
	
	if global_speed < 250:
		global_speed *= 1.01
		obstacles_timer.wait_time *= 0.99
	
