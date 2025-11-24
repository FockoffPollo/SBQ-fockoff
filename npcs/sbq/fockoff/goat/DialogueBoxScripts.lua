---@diagnostic disable: undefined-global

-- this is an example function with the args a script would recieve from being used as a "next" step
function dialogueStepScripts.exampleNextStep(dialogueTree, settings, branch, eid, ...)

	return "default" -- return the string for the next key in the dialogue tree to go down
end
