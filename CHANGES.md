## Release 1.x.x - 2021-??-??

 - Updated apultra to 1.4.5

## Release 1.1.9 - 2021-12-29

 - Generate a "what's new?" HTML page in the docs
 - `chksize` now accounts for data in INITIALIZED section that adds up to the
  ROM size
 - Updated apultra to 1.4.4
 - Small improvements to the build system, including a new openMSX target
  to run the game (thanks to Pedro de Medeiros)
 - Fix: `spman` could leave `sp_idx` unitialised, preventing the sprites from
  being shown. Thanks to ToriHino for reporting the issue.

## Release 1.1.8 - 2021-10-31

 - Updated apultra to 1.4.2
 - Improvements in the build pipeline, initial test code
 - Documented SDCC compatibility

## Release 1.1.7 - 2021-06-24

 - Documented the auxiliary tools used to build the example game

## Release 1.1.6 - 2021-06-07

 - `png2sprites.py`: Added a new `-c` flag to include the frame colour as
   a comment. This works as a reference and should make easier assign colours
   to frames later on in the game's code
 - `map.py`: remove bin files on error, fixed an error in error reporting
 - `png2tiles.py`: support to load the tileset combinng multiple images

   Thanks to Pedro de Medeiros for the changes!

## Release 1.1.5 - 2021-04-07

 - Small fix in mplayer to prevent issues changing song

## Release 1.1.4 - 2021-02-09

 - Even more Windows compatibility changes. Now it should successfully build on
   Windows 10, without big changes (if any)
 - Small fix in the example game stopping the music

## Release 1.1.3 - 2021-01-25

 - Yet more Windows compatibility changes

## Release 1.1.2 - 2021-01-11

 - Added missing files that prevented apultra from building

## Release 1.1.1 - 2021-01-09

 - Fix in ap.lib; the asm export was wrong
 - Added aplib support to the example game: the map is compressed

## Release 1.1.0 - 2021-01-09

 - Added extra libs: aPLib support

## Release 1.0.3 - 2021-01-04

 - Improved windows compatibility
 - Small doc fixes
 - Improvements in the example game

## Release 1.0.2 - 2020-12-31

  - Small doc fixes
  - Fixed a bug in the example game when `MAX_ENTITIES` are used

## Release 1.0.1 - 2020-12-31

  - Small doc fixes

## Release 1.0 - 2020-12-30

  - First public release

