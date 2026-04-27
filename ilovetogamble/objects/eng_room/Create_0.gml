
stage = 0
stageprogression = 0
stageFresh = true

stageSwitchTimer = function (timer, newstage) {
	stageFresh = false
	if stageprogression >= timer {
		stageprogression = 0
		stage = newstage
		stageFresh = true
	}
}