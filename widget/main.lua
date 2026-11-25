local INTERVAL = 43200000
local busy = false
local nextUpdate = 0
local seed = 0
local currentText = ""
local lastUrl = ""

local function nextRandom(max)
  if seed == 0 then seed = kumiki.millis() + 1337 end
  seed = (seed * 1103515245 + 12345) % 2147483648
  local n = (seed % max) + 1
  if math and math.floor then n = math.floor(n) end
  return n
end

local function render()
  if currentText == "" then return end
  for size = 3, 1, -1 do
    local pages = kumiki.text(currentText, size, 1) or 1
    if pages <= 1 then return end
  end
end

local function loadQuote()
  if busy then return end
  local repo = kumiki.get("repo")
  if not repo or repo == "" then repo = "R3adyPlay3r0ne/DailyStarfleet" end
  local count = tonumber(kumiki.get("count")) or 111
  if count < 1 then count = 111 end

  busy = true
  nextUpdate = kumiki.millis() + INTERVAL
  kumiki.show("Lade Logbuch ...")

  local id = nextRandom(count)
  lastUrl = "https://raw.githubusercontent.com/" .. repo .. "/refs/heads/main/quotes/" .. tostring(id) .. ".json"
  local ok, err = kumiki.request("GET", lastUrl)
  if not ok then
    busy = false
    kumiki.show("Netz prüfen: " .. tostring(err or "Fehler"))
    nextUpdate = kumiki.millis() + 60000
  end
end

function on_start() loadQuote() end
function on_config() loadQuote() end

function on_button(i)
  if i == 1 then
    loadQuote()
  end
end

function on_tick()
  if not busy and kumiki.millis() >= nextUpdate then
    loadQuote()
  end
end

function on_http(status, body, err)
  busy = false
  if err or status ~= 200 then
    kumiki.text("HTTP " .. tostring(status) .. "\n" .. lastUrl, 1, 1)
    nextUpdate = kumiki.millis() + 60000
    return
  end

  local data = kumiki.json(body)
  local q = data and (data.quote or data.q)
  if not q then
    kumiki.show("Zitat nicht lesbar")
    return
  end

  local a = data.author or data.a
  local author = a and tostring(a) or "Starfleet"
  currentText = '"' .. tostring(q) .. '"\n\n- ' .. author
  render()
end