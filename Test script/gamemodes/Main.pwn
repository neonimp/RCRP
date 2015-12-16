/*
    #define  0xFF0000FF
This page has been generated by ExtremePAWN
*/

//Callbacks.inc

#define PLAYER_ACTION_NONE      (0)
#define PLAYER_ACTION_SHOOTING  (1)
#define PLAYER_ACTION_SWIMMING  (2)
#define PLAYER_ACTION_SKYDIVING (3)
#define PLAYER_ACTION_JUMPING   (4)

//Includes

#include <a_samp>
#include <callbacks>
#include <a_actor>
#include <a_http>
#include <a_npc>
#include <a_objects>
#include <a_players>
#include <a_vehicles>
#include <a_sampdb>
#include <core>
#include <datagram>
#include <file>
#include <float>
#include <gl_common>
#include <gl_messages>
#include <string>
#include <time>
#include <vehicleutil>
#include <Defines_COLOR_VEH_WEAPONS>

enum
{
	DIALOG_GPS,
	DIALOG_WEAPONS
}

main()
{
	print("Welcome to our test server, Enjoy your stay =)");
	return 1;
}


public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("test server");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 24, 0, 0, 0, 0);
	return 1;
}

public OnPlayerActionChange(playerid, oldaction, newaction)
{
    if (newaction == PLAYER_ACTION_SHOOTING)
    {
    return 1;    //SendClientMessage(playerid, COLOR_WHITE, "You are now shooting a weapon.");
    }
    else if (newaction == PLAYER_ACTION_SKYDIVING)
    {
    return 1;
    }
    else if (newaction == PLAYER_ACTION_SWIMMING)
    {
	return 1;
    }
    else if (newaction == PLAYER_ACTION_JUMPING)
    {
    return 1;
	}
	return 0;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	// Color the name red when player is not spawned.
	SetPlayerColor(playerid, COLOR_RED);
	// Send a message to the connect client only to greet
	SendClientMessage (playerid, 0xFFFFFF, "Welcome to our test server, happy testing!");
	// Define a varible to hold the player nickname
	new pName[MAX_PLAYER_NAME];
	// Get the player nickname using the provided id and dump it into the pName variable
	GetPlayerName(playerid, pName, sizeof(pName));
	// Creates a 64 bytes lenght string to hold the public message
	new pubMessage[64];
	// Format the public message to for public display on the server and dump it into pubMessage variable
	// Number comes from characters multiplied by 2
	format(pubMessage, sizeof pubMessage, "%s has joined the server. Welcome!", pName);
	// Publicy display the pubMessage contents to the server
	SendClientMessageToAll(0xFFFFFF, pubMessage);
	// Return a success code
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerColor(playerid, COLOR_WHITE);
	GivePlayerMoney(playerid, 10000);
	SendClientMessage(playerid, COLOR_GREEN, "Enjoy your $10.000");
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{

	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
  new pText[144];
  format(pText, sizeof (pText), "(%d) %s", playerid, text);
  SendPlayerMessageToAll(playerid, pText);
  return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/fc", cmdtext, true, 10) == 0)
	{
		SetPlayerPos(playerid, -211.3621, 1001.3024,19.6920);
		SendClientMessage(playerid, COLOR_WHITE, "Welcome to Fort Carson");
		return 1;
	}

	if (strcmp("/help", cmdtext, true, 10) == 0)
	{
    return 1;
	}

 	if (strcmp("/weapons", cmdtext, true, 10) == 0)
	{
		SetPlayerArmour(playerid, 0.0);
		SetPlayerArmour(playerid, 100.0);
		ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST, "weapons",
		"Ak47\n\
		M4\n\
		Knife\n\
		Tec9\n\
		Desert Eagle\n\
		Shotgun\n\
		Rifle\n\
		"
		, "Select", "Cancel");
		return 1;
	}

 	if (strcmp("/god", cmdtext, true, 10) == 0)
	{
	 	SetPlayerHealth(playerid, 10000);
	 	SetPlayerColor(playerid, COLOR_BLUE);
	 	SendClientMessage(playerid, COLOR_WHITE, "Godmode activated");
 		return 1;
	}

  	if (strcmp("/respawn", cmdtext, true, 10) == 0)
	{
		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerHealth(playerid, 100.0);
		GivePlayerMoney(playerid, -10000);
		SpawnPlayer(playerid);
		ResetPlayerWeapons(playerid);
		return 1;
	}
 	if (strcmp("/commands", cmdtext, true, 10) == 0)
	{
	SendClientMessage(playerid, COLOR_WHITE, "/FC (Teleports to Fort Carson)");
    SendClientMessage(playerid, COLOR_WHITE, "/god (enables godmode");
    SendClientMessage(playerid, COLOR_WHITE, "/weapons (gives you weapons");
    SendClientMessage(playerid, COLOR_WHITE, "/respawn (respawn");
    return 1;
	}
	if (strcmp("/gps", cmdtext, true, 10) == 0)
	{
		// Open dialog and selection menu
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "gps",
		"Cityhall\n\
		Bank\n\
		FedEx depot\n\
		College\n\
		Dealership\n\
		Trucking depot\n\
		FedEx\n\
		"
		, "Select", "Cancel");
		return 1;
	}
	return 0;
}


public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	DisablePlayerCheckpoint(playerid);
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response)
  {
    switch(dialogid)
    {
      case DIALOG_GPS:
      {
        switch (listitem)
        {
          case 0:
          {
						SendClientMessage(playerid, COLOR_YELLOW, "You have selected City Hall");
						SetPlayerCheckpoint(playerid, -206.2056, 1118.9186, 20.2590, 3.0);// City hall
          }
          case 1:
          {
            SendClientMessage(playerid, COLOR_YELLOW, "You have selected Bank");
            SetPlayerCheckpoint(playerid, -176.7930, 1111.7858, 19.7422, 3.0);// Bank
          }
          case 2:
          {
          	SendClientMessage(playerid, COLOR_YELLOW, "You have selected FedEx");
          	SetPlayerCheckpoint(playerid, -145.0520, 1081.1747, 19.7500, 3.0);// FedEx depot
          }
          case 3:
          {
            SendClientMessage(playerid, COLOR_YELLOW, "You have selected College");
            SetPlayerCheckpoint(playerid, 110.2725, 1058.7499, 13.6154, 3.0);// College
		  		}
        	case 4:
		  		{
						SendClientMessage(playerid, COLOR_YELLOW, "You have selected Dealership");
						SetPlayerCheckpoint(playerid, 177.0127, 1183.2480, 14.7578, 3.0);//Dealership
		  		}
		  		case 5:
		  		{
						SendClientMessage(playerid, COLOR_YELLOW, "You have selected the trucking depot");
						SetPlayerCheckpoint(playerid, 584.6690, 1209.3134, 12.2333, 3.0);//Trucking depot
	      	}
		  		case 6:
		  		{
		    		SendClientMessage(playerid, COLOR_YELLOW, "You have selected the FedEx runway runway");
		    		SetPlayerCheckpoint(playerid, 346.3111, 1797.5247, 18.3872, 3.0);//FedEx Runway
  				}
    		}
    	}
			case DIALOG_WEAPONS:
   		{
    		switch (listitem)
        {
				 	case 0:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen an AK47");
				 		GivePlayerWeapon(playerid, AK47, 1000);
				 	}
				 	case 1:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen an M4");
				 		GivePlayerWeapon(playerid, M4, 1000);
				 	}
				 	case 2:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen a knife");
				 		GivePlayerWeapon(playerid, KNIFE, 1);
				 	}
				 case 3:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen a TEC9");
				 		GivePlayerWeapon(playerid, TEC9, 1000);
				 	}
				 	case 4:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen a Desert eagle");
				 		GivePlayerWeapon(playerid, DESERT_EAGLE, 1000);
				 	}
				 	case 5:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen a shotgun");
				 		GivePlayerWeapon(playerid, SHOTGUN, 1000);
				 	}
				 	case 6:
				 	{
				 		SendClientMessage(playerid, COLOR_RED, "You have choosen a Rifle");
				 		GivePlayerWeapon(playerid, RIFLE, 1000);
				 	}
			}
    }
  }
}
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
