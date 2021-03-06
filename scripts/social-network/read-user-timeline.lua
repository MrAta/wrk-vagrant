require "socket"
local time = socket.gettime()*1000
math.randomseed(time)
math.random(); math.random(); math.random()

request = function()
  local user_id = tostring(math.random(1, 962))
  local start = tostring(math.random(0, 100))
  local stop = tostring(start + 10)

  local args = "user_id=" .. user_id .. "&start=" .. start .. "&stop=" .. stop
  local method = "GET"
  local headers = {}
  headers["Content-Type"] = "application/x-www-form-urlencoded"
  -- Since nginx-thrift service is port-forwarded to the localhost, we use the localhost address  here:
  local path = "http://10.0.2.2:8080/wrk2-api/user-timeline/read?" .. args
  return wrk.format(method, path, headers, nil)

end
