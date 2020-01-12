/*
Thanks to: Bara, Abner, Cruze. Took help from their code.
*/
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <cstrike>
#include <multi1v1>

#pragma semicolon 1
#pragma newdecls required


int Rand;

public Plugin myinfo =
{
    name = "CS:GO Multi1v1: Random SMG round addon",
    author = "Cruze",
    description = "Adds SMG round-type",
    version = "1.0.0",
    url = ""
};

public void OnPluginStart()
{
  for(int client = 1; client <= MaxClients; client++)
  {
    if(client > 0 && client <= MaxClients && IsClientInGame(client))
    {
      OnClientPutInServer(client);
    }
  }

  HookEvent("round_start", Event_RoundStart);
}


public void Multi1v1_OnRoundTypesAdded()
{
  Multi1v1_AddRoundType("Random SMG", "smg", SmgHandler, true, false, "", true);
}

public Action Event_RoundStart(Event ev, char[] name, bool dbc)
{
  Rand = GetRandomInt(1, 6);
}


public void NoscopeHandler(int client)
{
  int iWeapon = -1;
  if(Rand == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_ump45");
  }
  else if (Rand == 2)
  {
    iWeapon = GivePlayerItem(client, "weapon_p90");
  }
  else if (Rand == 3)
  {
    iWeapon = GivePlayerItem(client, "weapon_mp5sd");
  }
  else if (Rand == 4)
  {
    iWeapon = GivePlayerItem(client, "weapon_mac10");
  }
  else if (Rand == 5)
  {
    iWeapon = GivePlayerItem(client, "weapon_mp7");
  }
  else
  {
    iWeapon = GivePlayerItem(client, "weapon_mp9");
  }
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}
