#using scripts\codescripts\struct;
#using scripts\shared\aat_shared;
#using scripts\shared\ai\systems\gib;
#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;
#using scripts\zm\_util;
#using scripts\zm\_zm;
#using scripts\zm\_zm_equipment;
#using scripts\zm\_zm_perks;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;

#namespace zm_roundaddperkslot;

function autoexec __init__sytem__()
{
	system::register("zm_roundaddperkslot", &init, &main, undefined);
}

function init()
{
	IPrintLn("Welcome to the mod");
	level flag::wait_till("initial_blackscreen_passed");
	thread add_perk_slot_at_round();
}

function add_perk_slot_at_round(){
	first_round_delay = 10;
	round_delay = 10;
	round_delay_count = first_round_delay;
	IPrintLnBold(round_delay_count);

	if(round_delay_count == 0){
		IPrintLnBold("Adding Perk Slot :)");
		round_delay_count = round_delay;
	} else{
		round_delay_count--;
	}
	level flag::wait_till( "between_round_over" );
	thread add_perk_slot_at_round();

}