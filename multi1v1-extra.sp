/*
Thanks to: Bara, Abner, Cruze. Took help from their code.
*/
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <cstrike>
#include <multi1v1>
#include <smlib>

#pragma semicolon 1
#pragma newdecls required


int RandSmg;
int RandArmor;
int RandHelmet;
int RandHeavy;
int RandAuto;
int RandRifle;
int RandPistol;

public Plugin myinfo =
{
    name = "CS:GO Multi1v1: Various stuff",
    author = "melkor217",
    description = "Adds some round types",
    version = "1.0.0",
    url = ""
};

public void OnPluginStart()
{
  HookEvent("round_start", Event_RoundStart);
}


stock void Client_SetHelmet(int client, bool helmet) {
    int offset = FindSendPropInfo("CCSPlayer", "m_bHasHelmet");
    SetEntData(client, offset, helmet);
}


public void Multi1v1_OnRoundTypesAdded()
{
  Multi1v1_AddRoundType("Scout", "scout", ScoutHandler, true, false, "", true);
  Multi1v1_AddRoundType("Deagle", "deagle", DeagleHandler, true, false, "", true);
  Multi1v1_AddRoundType("Random Rifle", "randrifle", RifleHandler, true, false, "", true);
  Multi1v1_AddRoundType("Random Pistol", "randpistol", PistolHandler, true, false, "", true);
  Multi1v1_AddRoundType("Random SMG", "smg", SmgHandler, true, false, "", true);
  Multi1v1_AddRoundType("Random Heavy", "heavy", HeavyHandler, true, false, "", true);
  Multi1v1_AddRoundType("Auto Sniper", "autosniper", AutoHandler, true, false, "", true);
  /* Multi1v1_AddRoundType("Deagle+500HP", "deagle500", Deagle500Handler, true, false, "", true); */
  Multi1v1_AddRoundType("Knife", "knife", KnifeHandler, true, false, "", true);
  Multi1v1_AddRoundType("Zeus+Nades", "zeus", ZeusHandler, true, false, "", true);
  Multi1v1_AddRoundType("Decoy", "decoy", DecoyHandler, true, false, "", true);
}

public Action Event_RoundStart(Event ev, char[] name, bool dbc)
{
  RandArmor = GetRandomInt(0, 1);
  RandHelmet = GetRandomInt(0, 1);
  RandSmg = GetRandomInt(1, 6);
  RandHeavy = GetRandomInt(1, 6);
  RandAuto = GetRandomInt(1, 2);
  RandRifle = GetRandomInt(1, 7);
  RandPistol = GetRandomInt(1, 10);
  LogError("Rand: %i %i %i %i %i %i %i", RandArmor, RandHelmet, RandSmg, RandHeavy, RandAuto, RandRifle, RandPistol);
}


public void SmgHandler(int client)
{
  LogError("SMG");
  if(RandHelmet && RandArmor)
  {
    Client_SetHelmet(client, true);
  }
  else
  {
    Client_SetHelmet(client, false);
  }
  if (RandArmor)
  {
    Client_SetArmor(client, 100);
  }
  else
  {
    Client_SetArmor(client, 0);
  }

  int iWeapon = -1;
  if(RandSmg == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_ump45");
  }
  else if (RandSmg == 2)
  {
    iWeapon = GivePlayerItem(client, "weapon_p90");
  }
  else if (RandSmg == 3)
  {
    iWeapon = GivePlayerItem(client, "weapon_mp5sd");
  }
  else if (RandSmg == 4)
  {
    iWeapon = GivePlayerItem(client, "weapon_mac10");
  }
  else if (RandSmg == 5)
  {
    iWeapon = GivePlayerItem(client, "weapon_mp7");
  }
  else if (RandSmg == 6)
  {
    iWeapon = GivePlayerItem(client, "weapon_bizon");
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

public void HeavyHandler(int client)
{
  LogError("Heavy");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);

  int iWeapon = -1;
  if(RandHeavy == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_nova");
  }
  else if (RandHeavy == 2)
  {
    iWeapon = GivePlayerItem(client, "weapon_xm1014");
  }
  else if (RandHeavy == 3)
  {
    iWeapon = GivePlayerItem(client, "weapon_sawedoff");
  }
  else if (RandHeavy == 4)
  {
    iWeapon = GivePlayerItem(client, "weapon_mag7");
  }
  else if (RandHeavy == 5)
  {
    iWeapon = GivePlayerItem(client, "weapon_m249");
  }
  else
  {
    iWeapon = GivePlayerItem(client, "weapon_negev");
  }
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void AutoHandler(int client)
{
  LogError("Auto");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);
  int iWeapon = -1;
  if(RandAuto == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_g3sg1");
  }
  else
  {
    iWeapon = GivePlayerItem(client, "weapon_scar20");
  }
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void RifleHandler(int client)
{
  LogError("Rifle");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);

  int iWeapon = -1;
  if(RandRifle == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_galilar");
  }
  else if(RandRifle == 2)
  {
    iWeapon = GivePlayerItem(client, "weapon_ak47");
  }
  else if(RandRifle == 3)
  {
    iWeapon = GivePlayerItem(client, "weapon_sg556");
  }
  else if(RandRifle == 4)
  {
    iWeapon = GivePlayerItem(client, "weapon_famas");
  }
  else if(RandRifle == 5)
  {
    iWeapon = GivePlayerItem(client, "weapon_m4a4");
  }
  else if(RandRifle == 6)
  {
    iWeapon = GivePlayerItem(client, "weapon_m4a1_silencer");
  }
  else
  {
    iWeapon = GivePlayerItem(client, "weapon_aug");
  }
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void PistolHandler(int client)
{
  LogError("Pistol");
  if(RandHelmet && RandArmor)
  {
    Client_SetHelmet(client, true);
  }
  else
  {
    Client_SetHelmet(client, false);
  }
  if (RandArmor)
  {
    Client_SetArmor(client, 100);
  }
  else
  {
    Client_SetArmor(client, 0);
  }
  int iWeapon = -1;
  if(RandPistol == 1)
  {
    iWeapon = GivePlayerItem(client, "weapon_glock");
  }
  else if(RandPistol == 2)
  {
    iWeapon = GivePlayerItem(client, "weapon_elite");
  }
  else if(RandPistol == 3)
  {
    iWeapon = GivePlayerItem(client, "weapon_p250");
  }
  else if(RandPistol == 4)
  {
    iWeapon = GivePlayerItem(client, "weapon_tec9");
  }
  else if(RandPistol == 5)
  {
    iWeapon = GivePlayerItem(client, "weapon_cz75a");
  }
  else if(RandPistol == 6)
  {
    iWeapon = GivePlayerItem(client, "weapon_deagle");
  }
  else if(RandPistol == 7)
  {
    iWeapon = GivePlayerItem(client, "weapon_revolver");
  }
  else if(RandPistol == 8)
  {
    iWeapon = GivePlayerItem(client, "weapon_usp_silencer");
  }
  else if(RandPistol == 9)
  {
    iWeapon = GivePlayerItem(client, "weapon_hkp2000");
  }
  else
  {
    iWeapon = GivePlayerItem(client, "weapon_fiveseven");
  }
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void ScoutHandler(int client)
{
  LogError("Scout");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);
  int iWeapon = -1;
  iWeapon = GivePlayerItem(client, "weapon_ssg08");
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void DeagleHandler(int client)
{
  LogError("Deagle");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);
  int iWeapon = -1;
  iWeapon = GivePlayerItem(client, "weapon_deagle");
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

/* public void Deagle500Handler(int client) */
/* { */
/*   Client_SetHelmet(client, true); */
/*   Client_SetArmor(client, 100); */
/*   Entity_SetHealth(client, 500); */
/*   int iWeapon = -1; */
/*   iWeapon = GivePlayerItem(client, "weapon_deagle"); */
/*   if(iWeapon != -1) */
/*   { */
/*     EquipPlayerWeapon(client, iWeapon); */
/*   } */
/*   Multi1v1_GivePlayerKnife(client); */
/* } */

public void KnifeHandler(int client)
{
  LogError("Knife");
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);
  Multi1v1_GivePlayerKnife(client);
}



public void DecoyHandler(int client)
{
  Client_SetHelmet(client, false);
  Client_SetArmor(client, 0);
  Entity_SetHealth(client, 3);
  int iWeapon = -1;
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}

public void ZeusHandler(int client)
{
  Client_SetHelmet(client, true);
  Client_SetArmor(client, 100);
  int iWeapon = -1;
  iWeapon = GivePlayerItem(client, "weapon_decoy");
  iWeapon = GivePlayerItem(client, "weapon_flashbang");
  iWeapon = GivePlayerItem(client, "weapon_hegrenade");
  iWeapon = GivePlayerItem(client, "weapon_hegrenade");
  iWeapon = GivePlayerItem(client, "weapon_incgrenade");
  iWeapon = GivePlayerItem(client, "weapon_molotov");
  iWeapon = GivePlayerItem(client, "weapon_smokegrenade");
  iWeapon = GivePlayerItem(client, "weapon_taser");
  if(iWeapon != -1)
  {
    EquipPlayerWeapon(client, iWeapon);
  }
  Multi1v1_GivePlayerKnife(client);
}
