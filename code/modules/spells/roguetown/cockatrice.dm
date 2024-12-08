/obj/effect/proc_holder/spell/targeted/cockatriceglare
	name = "Glare of the Cockatrice"
	range = 12
	overlay_state = "null"
	releasedrain = 0
	charge_max = 2 MINUTES
	max_targets = 0
	sound = 'sound/magic/marked.ogg'
	associated_skill = /datum/skill/magic/druidic
	req_items = list()
	invocation_type = "none"

/obj/effect/proc_holder/spell/targeted/cockatriceglare/cast(list/targets,mob/user = usr)
	var/list/attacked = list()
	for(var/mob/living/victim in targets)
		if (victim.stat == DEAD || victim.eye_blind)
			continue
		if (victim.mind)
			victim.show_message(span_warning("The Cockatrice turns its eyes towards me! Look away now!"), MSG_VISUAL)
			LAZYADD(attacked, victim)\
	sleep(5 SECONDS)
	for(var/mob/living/victim in attacked)
		if(victim.can_see_cone(user))
			victim.show_message(span_warning("THE TERROR!!!"), MSG_VISUAL)
			victim.Stun(10 SECONDS)
		else
			victim.show_message(span_notice("I looked away in time!"), MSG_VISUAL)
	return
