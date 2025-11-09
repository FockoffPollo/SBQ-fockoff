require("/scripts/object/SBQ_vore_object.lua")
require("/humanoid/any/sbqModules/base/voreScripts.lua")
local Rayez = {
	states = {
		default = {},
	},
	locations = {}
}
setmetatable(Rayez, sbq.SpeciesScripts.default)
for k, v in pairs(Rayez.states) do
	setmetatable(v, sbq.SpeciesScripts.default.states[k] or _State)
end
for k, v in pairs(Rayez.locations) do
	setmetatable(v, sbq.SpeciesScripts.default.locations[k] or _Location)
end

sbq.SpeciesScripts.Rayez = Rayez
Rayez.__index = Rayez

function Rayez:init()
end
function Rayez:update(dt)
	if not sbq.timerRunning("chatter") then
		sbq.randomTimer("chatter", config.getParameter("chatterDelayMin", 10), config.getParameter("chatterDelayMax", 30), doChatter)
	end
end
function Rayez:uninit()
end

-- default state scripts
local default = Rayez.states.default
function default:init()
end
function default:update(dt)
end
function default:uninit()
end

function default:rubBelly(args)
	if dialogueProcessor and dialogueProcessor.getDialogue(".rubBelly" .. (sbq.Occupants.checkActiveOccupants() and "Full" or "Empty")) then
		dialogueProcessor.speakDialogue()
	end
end

function default:rubBalls(args)
	if dialogueProcessor and dialogueProcessor.getDialogue(".rubBalls" .. (sbq.Occupants.checkActiveOccupants() and "Full" or "Empty")) then
		dialogueProcessor.speakDialogue()
	end
end

function doChatter()
	-- Only play chatter dialogue if there's someone nearby on the outside to hear it
	if checkSpectator() and dialogueProcessor and dialogueProcessor.getDialogue(".chatter" .. (sbq.Occupants.checkActiveOccupants() and "Full" or "Empty")) then
		dialogueProcessor.speakDialogue()
	end
end

function checkSpectator()
	-- Checks for a player or NPC nearby that isn't inside this object
	--TODO - Actually, it should also make sure that they aren't inside anyone/anything else...
	local spectators = world.entityQuery(entity.position(), config.getParameter("chatterRange", 5), {
		withoutEntityId = entity.id(), includedTypes = config.getParameter("chatterTargets", { "player" })
	})
	if #spectators > #sbq.Occupants.list then
		return true
	else
		for _, v in ipairs(spectators) do
			local isPrey = false
			for _, prey in ipairs(sbq.Occupants.list) do
				if prey.entityId == v then
					isPrey = true
					break
				end
			end
			if not isPrey then
				return true
			end
		end
	end
	return false
end