# R-eindeer
Trying to get a reindeer generator in R Shiny working - until Christmas!

Things I'm good at: digitally drawing reindeers.
Things I'm not good at: combining them all in a fancy R Shiny app.

## Table of contents
- preview: how it should look like in the end
- development history
- to do and current issues
- a description of all the jigsaw pieces needed to create a reindeer
  - all image layers are stored in folders in this repo

## All I want for Christmas
... is to figure out how R Shiny works.

The end product should look something like this, though (preview as sketched out in [GIMP](https://www.gimp.org/)):
Note: really quick and dirty sketch not meant to represent appropriate alignment, scale and general aesthetics.

### A plain reindeer with holly
Sorrel coat, dark highlights, dark hooves, light brown eyes, small brown antlers, holly around neck.\
<img src="http://i65.tinypic.com/2vccjsz.jpg" width="640">

### A fancy R reindeer
Grey coat, blue highlights, blue hooves, blue eyes, big blue antlers, bell around neck, halter, blue R blanket.\
<img src="http://i64.tinypic.com/awb886.jpg" width="640">
  
## development history
### Some screenshots documenting the evolution of the app.

**05.12.2018** Pink coat, blue highlights, blue hooves, blue eyes and a blue R blanket.\
<img src="http://i66.tinypic.com/330zbci.jpg" width="640">

**04.12.2018** - Sorrel coat, light highlights, light hooves, blue eyes.\
<img src="http://i66.tinypic.com/25a6tmo.jpg" width="640">

### Issues and development steps
**05.12.2018 - 19 days until christmas**
You can now equip your reindeer with a blanket. As a reaction to very justified user feedback, a pink coat colour was added. Some changes in the naming of outline files to make it consistent with the other folders.

**04.12.2018 #2 - 20 days until christmas**
I added all the different (buttons for) coat colours within the app. You can now also pick highlight colour, hoove colour and eye colour. For the eyes, I also added some necessary details as a fixed layer. Each category is represented by a different set of radio buttons, labelled with numbers for now.

**04.12.2018 #1 - 20 days until christmas**
Finally, the layers are overlapping due to (how appropriate) [magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html). Thank you [blondeclover](https://stackoverflow.com/users/8099834/blondeclover) and [Ian Wesley](https://stackoverflow.com/users/7384676/ian-wesley) from [Stackoverflow](https://stackoverflow.com) for helping out!

**03.12.2018 - 21 days until christmas** 
I've managed to change between basic coat colors with radio buttons. Unsolved so far: trying to get the outlines of the reindeer on top of the coat.

## To do & current issues
So far, it's an idea. It should work, somehow. I'm slowly figuring out how.
The general idea: select a coat colour via buttons, toggle highlights or accessories on and off, pick different versions of items (e.g. large or small antlers).

### to do
- slightly beautify readme file (with Rmarkdown?) - probably an ongoing issue as the project progresses
- include all the other accessories for the reindeer in the app
  - that also means: taking into account that these have their own outlines which must be shown together with the respective background image - but only when the accessory in question is selected
- find a smart solution for the interface
  - text next to the radio buttons will probably be quite long
  - it would be best to have colour icons for the different coats and stuff; let's see if I can do that
- find a smart(er) solution for "none" layers
  - so far, an empty layer image is added when e.g. no highlights are chosen this can be optimised
  - when "none" is chosen in a category (e.g. highlights), no layer should be rendered for that category
- find a smart solution to reduce rendering times
  - right now, it's a bit annoying to wait for the reindeer to be rendered (**holy cow, it's a pain!**)
  - there surely is a way to reduce waiting times here; probably something about preloading the images or something
  
  ## reindeer jigsaw pieces
You can already find the pieces neccessary to build your own reindeer in this repo. It's already possible to bring them together via GIMP, Photoshop etc. - or in an app, if you know what you're doing. Feel free to use the reindeer layers while I try to figure out how to get my Shiny app working!

### folder "coat"
The very basic of your reindeer: coat colour. Find in this folder the following colours: black, brown, sorrel, gold, cream, dark grey, grey.

### folder "highlights"
Need some variation? Add dark or light highlights to your reindeer's basic coat colour. Or some in R blue.

### folder "details"
All the tiny little things that make your reindeer look gorgeous. Necessary stuff for eyes and nostrils, different eye and hoove colours - and a red nose, of course!

### folder "antlers"
No reindeer would be complete without antlers. Find small and big ones - and a unicorn horn as well.

### folder "blanket"
We don't want the reindeer to be cold. You can pick from a colourful variety of blankets.

### folder "christmas hat"
The Christmas hat doesn't mix with the antlers (yet), but anyway: Have it in Christmas red or R blue!

### folder "halter"
A good reindeer will follow you anywhere without a halter. It does look nice, though.

### folder "neck"
What can make a reindeer even better than it already is? A pretty bow around its neck! Find different colours matching the blankets as well as a wreath of holly and a bell to make your reindeer shine.

### folder "outlines"
Necessarily, all of the different items are safed as background colour and outlines separately in order to easily modify them. In this folder, you'll find what keeps your reindeer in shape.

### GIMP file
I also included the .xcf file from GIMP. The different layers as well as the original drawings are stored there. You can toggle the different items by switching the different layers on and off. Don't forget to switch on the corresponding outline layer, though. Otherwise, it will look a bit odd. The GIMP file can also be opened in Photoshop.
