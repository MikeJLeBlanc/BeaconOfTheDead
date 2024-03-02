extends Node2D

var elapsedTime = 110.0
var twoMinuteMarker = 120
var thirtySecondTimer = 30
var isEnemyMad = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LightPivot.rotation += delta 
	elapsedTime += delta
	
	'''
	We need to check to see if the timers have elapsed for our enemy state.
	Every 2 minutes enemy state changes into a rage state where spawn and speed of enemies double.
	Visual changes include the lighthouse light turning read.
	'''
	if elapsedTime >= thirtySecondTimer && isEnemyMad == true:
		isEnemyMad = false
		changeEnemyState()
		elapsedTime = 0.0
	if elapsedTime >= twoMinuteMarker:
		isEnemyMad = true
		changeEnemyState()
		elapsedTime = 0.0


func changeEnemyState():
	if isEnemyMad:
		$LightPivot/NormalLight.color = Color("c90000")
		$LightPivot/NormalLight.energy = 7
	else:
		$LightPivot/NormalLight.color = Color("ecf679")
		$LightPivot/NormalLight.energy = 1
