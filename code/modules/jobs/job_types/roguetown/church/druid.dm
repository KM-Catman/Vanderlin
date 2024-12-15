/datum/job/roguetown/druid
	title = "Druid"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "Chores, exercise, prayer... and more chores. You are a humble acolyte at the temple in Vanderlin, not yet a trained guardian or an ordained priest. But who else would keep the fires lit and the floors clean?"
	outfit = /datum/outfit/job/roguetown/druid

	display_order = JDO_MONK
	give_bank_account = TRUE
	min_pq = -10
	bypass_lastclass = TRUE
	cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()

	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/key/church
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	mask = /obj/item/clothing/mask/rogue/druid
	neck = /obj/item/clothing/neck/roguetown/psycross/silver/dendor
	shirt = /obj/item/clothing/suit/roguetown/armor/leather/vest
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/rogueweapon/mace/goden/shillelagh

	if(H.mind)
		if(H.patron != /datum/patron/divine/dendor)
			H.set_patron(/datum/patron/divine/dendor)

		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/labor/taming, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)

		if(H.age == AGE_OLD)
			H.mind?.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		else
			H.change_stat("endurance", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)
