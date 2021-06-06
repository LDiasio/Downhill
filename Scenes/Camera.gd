extends Node2D

onready var small_shake_player = $Players/SmallShakePlayer

func small_shake():
	small_shake_player.stop()
	small_shake_player.play("SmallShake")
