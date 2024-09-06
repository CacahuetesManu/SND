# Hunt Log Doer

## This script requires all files in this folder. MAKE SURE TO TELL SND WHERE THEY ARE (SND OPTIONS --> LUA PATHS)

###  CURRENTLY ONLY SUPPORTS FLYING MOUNTS OR WALKING. (I'm working on a fix).
1. Make sure you have the right plugins.
   
					1. Chat Coordinates
					2. VNAVMESH
					3. Pandora
					4. RSR
					5. BMR

3. Make sure to set up your paths. Use the Lua path setting in the SND help config.
   
Like this:
![screenshot](https://github.com/CacahuetesManu/SND/blob/main/Hunt Log Doer/Docs/LuaPaths.png)

5. Change RSR to attack ALL enemies when solo, or previously engaged.

6. Modify the variables in the script to match what you want.
   ```
	--Choose either "class" to do your class log or "GC" to do your Grand Company Log

   	route = "class"

	--Choose what rank to start 1,2, 3, 4 or 5
	
 	RankToDo = 1
   ```

5. If you are having issues tracking the kills, try to manually change your hunt log in the game to "Show Incomplete"

6. If you are interested in improving the coordinates, reach out to me! I can show you how to help. 
