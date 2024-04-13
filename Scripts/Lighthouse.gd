extends Node2D

@export var game_stats: GameStats
@onready var light_pivot = $LightPivot
@onready var raid_siren = $AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# light rotation wont work down below for some reason.
	if game_stats.enemyState:
		light_pivot.rotate(delta)
	else:
		light_pivot.rotate(delta / 2)
		
	game_stats.enemyRageTimer += delta
	game_stats.totalTime += delta
	
	'''
	We need to check to see if the timers have elapsed for our enemy state.
	Every minute enemy state changes into a rage state where spawn and speed of enemies double.
	Visual changes include the lighthouse light turning read. Audio queue is a siren.
	'''
	#normal gameplay
	if game_stats.enemyRageTimer >= game_stats.thirtySecondTimer && game_stats.enemyState == true:
		game_stats.enemyState = false
		$LightPivot/NormalLight.color = Color("ecf679")
		$LightPivot/NormalLight.energy = 1
	
	# enemy rage
	if game_stats.enemyRageTimer >= game_stats.oneMinuteTimer:
		game_stats.enemyState = true
		$LightPivot/NormalLight.color = Color("c90000")
		$LightPivot/NormalLight.energy = 2
		game_stats.enemyRageTimer = 0.0
		raid_siren.play()
