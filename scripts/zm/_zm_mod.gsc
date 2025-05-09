#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\hud_message_shared;
#using scripts\shared\util_shared;
#using scripts\shared\_oob;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\statstable_shared.gsh;
#insert scripts\shared\version.gsh;

#using scripts\shared\ai\zombie_utility;

#using scripts\zm\_util;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_perks;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_melee_weapon;
#using scripts\zm\gametypes\_clientids;

#using scripts\zm\_zm_magicbox;
#using scripts\zm\_zm_unitrigger;
#using scripts\zm\_zm_blockers;

#using scripts\shared\aat_shared;

#insert scripts\zm\_zm_perks.gsh;
#insert scripts\zm\_zm_utility.gsh;


#namespace zm_mod;

function main() {
    level flag::wait_till("initial_blackscreen_passed");
	IPrintLnBold("zm_mod initialised");
	first_round_delay = 9;
	thread add_perk_slot_at_round(first_round_delay);
}

function add_perk_slot_at_round(round_delay_count){
	
	round_delay = 10;
	IPrintLnBold(round_delay_count);
	if(round_delay_count == 0){
		IPrintLnBold("Adding Perk Slot :)");
		// Everything before this point works fine
		round_delay_count = round_delay;
		level.perk_purchase_limit += 1;
	}
	round_delay_count--;
	level waittill("end_of_round");
	add_perk_slot_at_round(round_delay_count);
}


