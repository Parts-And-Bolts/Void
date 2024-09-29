extends Node

var canJump = true
var batteryLevel = 100
var isRecharging = false
var canControl = true
var timeLeft = 120

var gameStarted = false

func setDefaults():
	canJump = true
	batteryLevel = 100
	isRecharging = false
	canControl = true
	timeLeft = 120

	gameStarted = false
	OutOfTime.visible = false
	Stunned.visible = false
	recharging.visible = false
