	object_const_def
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER
	

CherrygrovePCM_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript
	
CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "Oh, you don't know"
	line "what the PCM is?"

	para "PCM stands for"
	line "#MON CENTER AND"
	cont "MART!"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "# BALLS are in"
	line "stock! Now I can"
	cont "catch #MON!"
	done

CherrygroveMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #MON poi-"
	line "soned my #MON!"

	para "I just kept going,"
	line "but then my"
	cont "#MON fainted."

	para "You should keep an"
	line "ANTIDOTE with you."
	done

CherrygrovePCM_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CHERRYGROVE_CITY, 2
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	warp_event 15,  7, CHERRYGROVE_CITY, 1
	warp_event 16,  7, CHERRYGROVE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event 13,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
