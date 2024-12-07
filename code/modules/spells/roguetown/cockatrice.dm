/obj/effect/proc_holder/spell/targeted/cockatriceglare
	name = "Glare of the Cockatrice"
	range = 12
	overlay_state = "null"
	releasedrain = 5
	charge_max = 30
	max_targets = 0
	sound = 'sound/magic/marked.ogg'
	associated_skill = /datum/skill/magic/druidic
	req_items = list()
	invocation_emote_self = span_notice("My eyes glaze with an intense glare.")
	invocation_type = "emote" //can be none, whisper, emote and shout
	invocation = "glares intensely."

/obj/effect/proc_holder/spell/targeted/cockatriceglare/cast(list/targets,mob/user = usr)

	for(var/mob/living/victim in targets)
		if (victim.stat == DEAD || victim.eye_blind)
			continue
		if (victim.mind)
			user.visible_message("The Cockatrice turns to glare at [victim]!", "I turn my gaze towards [victim]!")
			victim.show_message("The Cockatrice turns its eyes towards me! Look away now!", MSG_VISUAL)
			sleep(5 SECONDS)
			victim.can_see_cone(user)
			victim.Stun(10 SECONDS)
	return
