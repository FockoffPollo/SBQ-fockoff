### humanoid

here in this folder, you'll find the template for creating a species for your character, this is something you should only do if you're creating unique graphics for your character, which is probably what you're doing anyway! if your character just uses the same sprites as the vanilla species, only having different clothes, you can probably delete this folder

A new species/character needs at minimum needs these files, youc an look up a tutorial on making a new species to explain these more, I feel they're all self explanitory enough

-`femalebody.png`
-`femalehead.png`
-`malebody.png`
-`malehead.png`
-`frontarm.png`
-`backarm.png`
-`emote.png`

### SBQ specific body parts

-`belly.png`
-`tail.png`
-`breastsCover.png`
-`breastsFront.png`
-`breastsBack.png`
-`pussy.png`
-`cock.png`
-`ballsFront.png`
-`ballsBack.png`

These sprites are for SBQ animations which Anim overrides facilitates existing, take a look at them, and judge if your character actually needs a unique sprite for it, such as if theres special markings that would be on that part of the body. If the character has no special markings on that part of the body you don't need to have these images here, and can delete them, and use Anim override's color remap system, said system can also be used for making the navel or nipples exist on the sprites as well, so do take that into consideration regarding the markings and such.

### Anim override's remap parts

regardless of if you're using the remap parts, do make sure to check `sbqAnimOverrideParts.config` and remove any parts your NPC does not need.

If you don't need unique sprites, then good! that also means you're somewhat future proofed in that if I update any sprites later on, such as adding another size or animation, you won't need to edit your own sprites since they're already pulling from mine.

there are comments in the file explaining what to remove or edit
