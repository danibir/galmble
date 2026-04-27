stageprogression++
switch (stage) {
	case 0:
	stageSwitchTimer(60, 1)
	break
	case 1:
	curtains.darkness = 1 - (stageprogression / 120)
	stageSwitchTimer(120, 2)
	break
	case 2:
	if stageFresh {
		var menu = instance_create_layer(0, 0, "Curtain", eng_menu)
		menu.createButton("Start", function () {
			show_message("start")
		}, 128, 28)
		menu.createButton("...", function () {
		
		}, 128, 28)
		menu.createButton("...", function () {
		
		}, 128, 28)
		menu.createButton("...", function () {
		
		}, 128, 28)
		menu.createButton("Quit", function () {
			game_end()
		}, 128, 28)
		menu.xoffset = room_width / 2
		menu.yoffset = room_height - 8
		menu.yallign = -1
	}
	curtains.curtainOpenness = stageprogression / 45
	stageSwitchTimer(45, 3)
	break
}