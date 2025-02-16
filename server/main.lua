if CHECK_TYPE == 'client' then
  return;
end

---@class WeaponDamageEvent
---@field actionResultId number
---@field actionResultName number
---@field damageFlags number
---@field damageTime number
---@field damageType number
---@field f104 number
---@field f112 number
---@field f112_1 number
---@field f120 number
---@field f133 number
---@field hasActionResult boolean
---@field hasImpactDir boolean
---@field hasVehicleData boolean
---@field hitComponent number
---@field hitEntityWeapon number
---@field hitGlobalId number
---@field hitGlobalIds number[]
---@field hitWeaponAmmoAttachment boolean
---@field impactDirX number
---@field impactDirY number
---@field impactDirZ number
---@field isNetTargetPos boolean
---@field localPosX number
---@field localPosY number
---@field localPosZ number
---@field overrideDefaultDamage boolean
---@field parentGlobalId number
---@field silenced boolean
---@field suspensioIndex number
---@field tyreIndex number
---@field weaponDamage number
---@field weaponType number
---@field willKill boolean

---@param data WeaponDamageEvent
AddEventHandler('weaponDamageEvent', function(_, data)
  if data.willKill or not data.hitGlobalId or not data.isNetTargetPos or data.localPosZ < 0.319 or not HEAD_HIT_COMPONENTS[data.hitComponent] then
    return;
  end

  local ped = NetworkGetEntityFromNetworkId(data.hitGlobalId);

  if not ped or not DoesEntityExist(ped) or GetEntityType(ped) ~= 1 then
    return;
  end

  TriggerClientEvent('a_oneshot_sync::Suicide', NetworkGetEntityOwner(ped));
end);
