# What to do here

This `tenant.npctype` file is the most important file of the NPC as it determines all of their dialogue as well as their settings, behavior, vore prefrences, and any uinque scrips they may have.

I have also provided `crewmember.npctype` here which is used for if you want them to be recruitable as crew! if not you can delete it and not worry about it, if you do want to use it you need to uncomment a line in `tenant.npctype`'s quest generator graduation parameters.

## identity

The identity of your NPC, their appearance and etc, if you want to manually define all that data, you can do so, however, if you are making an NPC that uses existing customization for an existing race, and want a silightly easier time, you can just use the ingame character creator to make your character!

If you've created a player character and you want to use their appearance for an NPC, you can head into your storage folder, and find the correct `.player` file for the character you created, easiest way to get the right one is to have it be your most recenly played character, so therefore will be the most recently modified file, then you'll want to look in your `starbound` folder for a folder that matches the name of your OS, inside you'll find a file called `dump_versioned_json` you will then want to open a command terminal, drag `dump_versioned_json` into it, then drag the `.player` file you want to dump into it, twice, first for input, second for output and append `.json` onto the end of the second one, and hit enter, this will dump a human readable json file of the player data, within which you will be able to find the `identity` table, you can now just copy that over to your NPC and they will have the same customizations!

## uniqueId

This is a must if you don't want to have multiple instances of the same character around, it should be replaced with the ID of your NPC, if not, do that now.

## voreConfig

This is used for SBQ specific data regarding what the NPC's default settings are, what actions they can perform, among other things. It is very important to look at this and go over it to make sure your NPC won't be partaking in kinks you don't want them to!

## dialogueStepScripts

If you want to have scripts for custom behavior for the dialogue tree and dialoguebox, add some scripts to the `dialogueStepScripts` arg.

Scripts added here are used by the dialogue tree when handling `next` steps

## dialogueTree

This, this will likely be the largest endeavor in making an OC if you don't just want to use the default lines already created.

The `dialogueTree` table points to all the lines the NPC will have for various interactions which are within `sbq/Username/Charactername.dialogueTree`, you can either define unique lines to your NPC by editing or adding lines to the contexts already there, all the dialogue itself should be contained in the `sbq/Username/Charactername.dialogue` file

The dialogue tree has multiple starts relating to different contexts, only the start of each part of the tree is pre defined and must be used, after the start, one can delete or change anything about the tree to make it behave as they wish for their NPC, and get as specific in context of a certain vore type as they wish with their lines by checking the current settings.

## deleting unecessary parts

If there are any parts of the config here you may feel are unecessary for your NPC, such as parts of the dialogue tree containing lines for things your NPC will not be partaking in, just delete that part of the tree! there should be no consequences as long as you do it correctly, which is why I suggest using an editor such as VSC so you can just collapse the region, and easily see what you have to delete

you can also delete parts of the dialogue tree you simply do not want to write dialogue for and it will continue to function for the parts you have written. In the case of a deleted part being for a prompt where the NPC asks the player to do something, it will fall back to a generic radial menu prompt that is also used when dialogue is disabled on the NPC. If you truly want to disable the NPC from requesting or seeking out specific actions, one must override their settings for it in the npc's `voreConfig`.

## Checking if you have any missing dialogue

to check if you have any missing dialogue that is referenced in your dialouge tree you can use this node js script, it will sort all the dialogue contexts that your tree has referenced in order, as well as inserting notes for missing dialogue, which you could then either decide to remove from the tree, or fill out the missing dialogue. Any dialogue within the file that isn't referenced by the tree will be placed at the bottom of the file underneath an 'unused' comment.
`node sortDialogue.js 'npcs/sbq/Username/Charactername/npc.dialogueTree' 'npcs/sbq/Username/Charactername/npc.dialogue'`

this script doesn't care about dialouge that has a path pointing outside the relevant file, so be aware of that if you are pointing to other files as well.
