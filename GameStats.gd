class_name GameStats
extends Resource

var thirtySecondTimer: float = 30.0
var oneMinuteTimer: float = 60.0 
var totalTime: float = 0
var highscore: int = 0

# signals 

# true is rage mode false is normal
var enemyState: bool = false :
	set(boolean):
		enemyState = boolean
		enemyState_changed.emit(enemyState)

var score: int = 0 :
	set(value):
		score = value
		score_changed.emit(score)
		
var enemyRageTimer: float = 55.00

signal score_changed(new_score)
signal enemyState_changed(booleanState)

# Quantum-arcade values: 1 is default guest account
var userId: int = 1 :
	set(value):
		userId = value

var gameId = 5 # set this to next available game slot on server. probably 5
