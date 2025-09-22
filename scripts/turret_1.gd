extends Node3D

func _on_patrol_zone_area_entered(area: Area3D):
	print(area, "enter")

func _on_patrol_zone_area_exited(area: Area3D):
	print(area, "exit")
