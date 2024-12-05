/mob/living/simple_animal/hostile/retaliate/rogue/cockatrice
	icon = 'icons/roguetown/mob/monster/trolls.dmi'
	name = "cockatrice"
	desc = "A horrendous beast of feather and scale with a gaze to turn away any man with fear. Considered by some to be the failed creation of Malum."
	icon_state = "Troll2"
	icon_living = "Troll2"
	icon_dead = "Troll2d"
	pixel_x = -16

	faction = list("orcs")
	footstep_type = FOOTSTEP_MOB_HEAVY
	emote_hear = null
	emote_see = null
	verb_say = "caws"
	verb_ask = "warbles"
	verb_exclaim = "roars"
	verb_yell = "roars"

	turns_per_move = 2
	see_in_dark = 16
	move_to_delay = 6
	vision_range = 8
	aggro_vision_range = 8

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/poultry = 8,
						/obj/item/natural/feather = 3)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/poultry = 10,
						/obj/item/natural/hide = 3,
						/obj/item/natural/feather = 4)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/poultry= 10,
						/obj/item/natural/hide = 4,
						/obj/item/natural/feather = 6)

	health = COCKATRICE_HEALTH
	maxHealth = COCKATRICE_HEALTH
	food_type = list(
					/obj/item/bodypart,
					/obj/item/organ,
					/obj/item/reagent_containers/food/snacks/produce/wheat,
					/obj/item/reagent_containers/food/snacks/produce/oat) // It's still a chicken

	base_intents = list(/datum/intent/simple/peckdeadly)
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	melee_damage_lower = 25
	melee_damage_upper = 40
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES

	STACON = 12
	STASTR = 17
	STASPD = 2
	STAEND = 17

	retreat_distance = 4
	minimum_distance = 0
	deaggroprob = 0
	defprob = 20
	defdrain = 15
	del_on_deaggro = 0
	retreat_health = 150
	food_max = 250
	food = 0
	dodgetime = 20
	aggressive = TRUE
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/cockatrice
	body_eater = FALSE

	ai_controller = /datum/ai_controller/troll
	AIStatus = AI_OFF
	can_have_ai = FALSE


/mob/living/simple_animal/hostile/retaliate/rogue/cockatrice/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/retaliate/rogue/cockatrice/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/cockatrice/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/troll/aggro1.ogg','sound/vo/mobs/troll/aggro2.ogg')
		if("pain")
			return pick('sound/vo/mobs/chikn/pain (1).ogg','sound/vo/mobs/chikn/pain (2).ogg','sound/vo/mobs/chikn/pain (3).ogg')
		if("death")
			return 'sound/vo/mobs/chikn/death.ogg'
		if("idle")
			return pick('sound/vo/mobs/chikn/idle (1).ogg','sound/vo/mobs/chikn/idle (2).ogg','sound/vo/mobs/chikn/idle (3).ogg','sound/vo/mobs/chikn/idle (4).ogg','sound/vo/mobs/chikn/idle (5).ogg','sound/vo/mobs/chikn/idle (6).ogg')
		if("cidle")
			return pick('sound/vo/mobs/troll/cidle1.ogg','sound/vo/mobs/troll/aggro2.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/cockatrice/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/troll/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)
	if(fire_stacks <= 0)
		adjustHealth(-rand(20,35))


/mob/living/simple_animal/hostile/retaliate/rogue/troll/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "beak"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "beak"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "wing"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "wing"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "wing"
		if(BODY_ZONE_L_ARM)
			return "wing"
	return ..()

/obj/effect/decal/remains/cockatrice
	name = "remains"
	gender = PLURAL
	icon_state = "mole_bones"
	icon = 'icons/roguetown/mob/monster/mole.dmi' // mole bones is a placeholder
