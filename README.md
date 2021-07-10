# Falling Cubes Love2D

Falling Cubes Love2D is the Love2D version of Falling Cubes, the game I wrote in BASIC using App Game Kit.

Falling Cubes uses Love2D as the framework and Lua as the programming language.
Falling Cubes Love2D was written with an object-oriented programming architecture in mind.

Every object in Falling Cubes Love2D is derived from a base module, entity. Eg. the player is and entity.

Falling Cubes Love2D has a few new and cooler features than the BASIC version. One of these features is a particles system that I made myself. It works by creating one parent object, particles. Then it creates a set number of new objects, parts. The parts object is controlled by the particles object. Once the particles are destroyed, so are the parts. This allows me to have multiple different particle types running at once without having to worry about destroying the wrong ones.

Another neat feature is the difficulty system. Difficulty in the game scales over time, but higher difficulty starts you at a higher scale while increasing how hard the game gets over time as well. Each difficulty even has its own highscore assigned to it. This ensures that the player can play every difficulty and see how well they do on each.

The final new feature is the saving and loading system. The player doesn't interact with this system at all but their highscores are saved after the end of each round. This is an important feature as the player might forget their highscore and want to come back to remeber their last highscore and get a new highscore.

Falling Cubes Love2D also has sound and music, the music is muted by default. I made the sound effects using bfxr and the music with bosca ceoil.

Falling Cubes Love2D is the first game I've made that has sound and music.
