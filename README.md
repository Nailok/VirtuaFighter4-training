# VF4 Training Mode
This is a basic training mode for arcade VF4:FT via [Flycast](https://github.com/flyinghead/flycast) or [Flycast Dojo](https://github.com/blueminder/flycast-dojo) .

Supported version right now is VF4:FT (Revision. B, vf4tuned, gds-0036f)

![1](https://user-images.githubusercontent.com/61318430/167488734-939fdfbd-c375-41c8-a506-598cc1542e45.png)

# How to use
1. Extract archive content to the place where flycast.exe located. vf4_training.lua and vf4_training folder should be in the same place where .exe located
2. Write "vf4_training.lua" (without quotes) in Settings -> Advanced -> Lua Scripting, then restart emulator.
3. When in game: open emulator menu -> Cheats -> Load -> open file from cheats folder

# Known problems
- Some moves that can be delayed are showing incorrect startup, because of how the game stores this data (E.g. Jeffry's 1K+G, Lau's P+K)
- Using VF1 costume (press and hold P+K+G when picking character before 'normal' or 'challenge' mode) can crash the game VS CPU with some characters

# TODO
- [x] Change A and B moves
- [ ] Counter-hit state
- [ ] Switch stance
- [ ] Reset positions
- [ ] Another frame data window for P2
