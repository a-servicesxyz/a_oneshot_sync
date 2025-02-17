if CHECK_TYPE == 'server' then
  RegisterNetEvent('a_oneshot_sync::Suicide', function()
    SetEntityHealth(PlayerPedId(), 0);
  end);

  return;
end

AddEventHandler('gameEventTriggered', function(event, args)
  print(args[6]);

  if event ~= 'CEventNetworkEntityDamage' or args[6] ~= 0 then
    return;
  end

  local victim = args[1];

  if not victim or victim == 0 or not IsEntityAPed(victim) or IsEntityDead(victim) or PlayerPedId() ~= victim then
    return;
  end

  if GetPlayerInvincible(PlayerId()) then
    return;
  end

  local killer = args[2];

  if not killer then
    return;
  end

  local hasFoundBone, bone = GetPedLastDamageBone(victim);

  if not hasFoundBone or not VALID_BONES[bone] then
    return;
  end

  ApplyDamageToPed(victim, GetEntityHealth(victim), false);
end);
