-- if the event should be handled on the server or the client
CHECK_TYPE = 'client'; -- server or client

if CHECK_TYPE == 'server' then
  -- only for the server
  HEAD_HIT_COMPONENTS = {
    [19] = true,
    [20] = true
  };
else
  -- only for the client
  VALID_BONES = {
    [12844] = true,
    [31086] = true
  };
end
