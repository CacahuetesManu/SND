--[[ This script can be used to teleport you to a zone and then it calls questionable to do the missing aethercurrent quests.Expected bugs are zones with regions that are inaccesible to certain aetherytes. Report bugs and I can fix this!
-Necessary plugins: Questionable, Teleporter, Lifestream
]]
yield("/tp Falcon's Nest")
yield("/qst next 1744") --Bridge over Frozen Water
yield("/qst start")

while IsQuestComplete(1744) == false do
    yield("/wait 1")
end

yield("/qst next 1759") --Protecting What's Important
yield("/qst start")

while IsQuestComplete(1759) == false do
    yield("/wait 1")
end

yield("/qst next 1760") --Baby Steps
yield("/qst start")

while IsQuestComplete(1760) == false do
    yield("/wait 1")
end

yield("/qst next 2111") --For All the Nights to Come
yield("/qst start")

while IsQuestComplete(2111) == false do
    yield("/wait 1")
end
yield("/tp Camp Cloudtop")
yield("/qst next 1748") --Clipped Wings
yield("/qst start")

while IsQuestComplete(1748) == false do
    yield("/wait 1")
end

yield("/qst next 1901") --Search and Rescue
yield("/qst start")

while IsQuestComplete(1901) == false do
    yield("/wait 1")
end

yield("/qst next 1909") --Sleepless in Ok' Zundu
yield("/qst start")

while IsQuestComplete(1909) == false do
    yield("/wait 1")
end

yield("/qst next 1910") --Flying the Nest
yield("/qst start")

while IsQuestComplete(1910) == false do
    yield("/wait 1")
end
yield("/tp Tailfeather")
yield("/qst next 1802") --A Lesson in Humility
yield("/qst start")

while IsQuestComplete(1802) == false do
    yield("/wait 1")
end

yield("/qst next 1771") --Some Bad News
yield("/qst start")

while IsQuestComplete(1771) == false do
    yield("/wait 1")
end

yield("/qst next 1792") --Natural Repellent
yield("/qst start")

while IsQuestComplete(1792) == false do
    yield("/wait 1")
end

yield("/qst next 1798") --Chocobo's Last Stand
yield("/qst start")

while IsQuestComplete(1798) == false do
    yield("/wait 1")
end

yield("/tp Idyllshire")
yield("/qst next 1945") --Ebb and Aetherflow
yield("/qst start")

while IsQuestComplete(1945) == false do
    yield("/wait 1")
end

yield("/tp Idyllshire")
yield("/qst next 1963") --Taking Stock
yield("/qst start")

while IsQuestComplete(1963) == false do
    yield("/wait 1")
end

yield("/tp Idyllshire")
yield("wait 10")
yield("/li Epilogue Gate")
yield("/qst next 1966") --Saro Roggo's Common Life
yield("/qst start")

while IsQuestComplete(1966) == false do
    yield("/wait 1")
end

yield("/qst next 1936") --Louder than Words
yield("/qst start")

while IsQuestComplete(1936) == false do
    yield("/wait 1")
end
yield("/tp Moghome")
yield("/qst next 1819") --The Bathing Bully
yield("/qst start")

while IsQuestComplete(1819) == false do
    yield("/wait 1")
end

yield("/qst next 1823") --Road Kill
yield("/qst start")

while IsQuestComplete(1823) == false do
    yield("/wait 1")
end

yield("/qst next 1829") --The Unceasing Gardener
yield("/qst start")

while IsQuestComplete(1829) == false do
    yield("/wait 1")
end

yield("/qst next 1835") --Waiting to Inhale
yield("/qst start")

while IsQuestComplete(1835) == false do
    yield("/wait 1")
end

yield("/tp Castrum Oriens")
yield("/qst next 2661") --The Hidden Truth
yield("/qst start")

while IsQuestComplete(2661) == false do
    yield("/wait 1")
end

yield("/qst next 2639") --Magiteknical Failure
yield("/qst start")

while IsQuestComplete(2639) == false do
    yield("/wait 1")
end

yield("/qst next 2816") --Unexpected Guests
yield("/qst start")

while IsQuestComplete(2816) == false do
    yield("/wait 1")
end

yield("/qst next 2821") --Eyes Bigger than Her Stomach
yield("/qst start")

while IsQuestComplete(2821) == false do
    yield("/wait 1")
end
yield("/tp Ala Gannha")
yield("/qst next 2655") --Saint Sayer
yield("/qst start")

while IsQuestComplete(2655) == false do
    yield("/wait 1")
end

yield("/qst next 2842") --Out of Sight
yield("/qst start")

while IsQuestComplete(2842) == false do
    yield("/wait 1")
end

yield("/qst next 2851") --A Hunger for Trade
yield("/qst start")

while IsQuestComplete(2851) == false do
    yield("/wait 1")
end

yield("/qst next 2860") --Closing Up Shop
yield("/qst start")

while IsQuestComplete(2860) == false do
    yield("/wait 1")
end
yield("/tp Porta Praetoria")
yield("/qst next 2877") --It's a Zu Out There
yield("/qst start")

while IsQuestComplete(2877) == false do
    yield("/wait 1")
end

yield("/qst next 2880") --A Rite to Rest
yield("/qst start")

while IsQuestComplete(2880) == false do
    yield("/wait 1")
end

yield("/qst next 2881") --If I Were a Fish
yield("/qst start")

while IsQuestComplete(2881) == false do
    yield("/wait 1")
end

yield("/qst next 2883") --Are They Ill-tempered
yield("/qst start")

while IsQuestComplete(2883) == false do
    yield("/wait 1")
end
yield("/tp Onokoro")
yield("/qst next 2632") --The Palace of Lost Souls
yield("/qst start")

while IsQuestComplete(2632) == false do
    yield("/wait 1")
end

yield("/qst next 2687") --Pulling Double Booty
yield("/qst start")

while IsQuestComplete(2687) == false do
    yield("/wait 1")
end

yield("/qst next 2693") --The Sword in the Stone
yield("/qst start")

while IsQuestComplete(2693) == false do
    yield("/wait 1")
end

yield("/qst next 2673") --The Price of Betrayal
yield("/qst start")

while IsQuestComplete(2673) == false do
    yield("/wait 1")
end
yield("/tp Namai")
yield("/qst next 2728") --Fly, My Pretties
yield("/qst start")

while IsQuestComplete(2728) == false do
    yield("/wait 1")
end

yield("/qst next 2730") --Whacking Day
yield("/qst start")

while IsQuestComplete(2730) == false do
    yield("/wait 1")
end

yield("/qst next 2733") --Wolves and Weeds
yield("/qst start")

while IsQuestComplete(2733) == false do
    yield("/wait 1")
end

yield("/qst next 2724") --Something Smells
yield("/qst start")

while IsQuestComplete(2724) == false do
    yield("/wait 1")
end
yield("/tp Reunion")
yield("/qst next 2771") --Sheep Snatcher
yield("/qst start")

while IsQuestComplete(2771) == false do
    yield("/wait 1")
end

yield("/qst next 2782") --Forty Years and Counting
yield("/qst start")

while IsQuestComplete(2782) == false do
    yield("/wait 1")
end

yield("/qst next 2791") --Mauci of the Seven Worries
yield("/qst start")

while IsQuestComplete(2791) == false do
    yield("/wait 1")
end

yield("/qst next 2760") --Words Are Very Unnecessary
yield("/qst start")

while IsQuestComplete(2760) == false do
    yield("/wait 1")
end
yield("/tp Crystarium")
yield("/qst next 3380") --A Jobb Well Done
yield("/qst start")

while IsQuestComplete(3380) == false do
    yield("/wait 1")
end
yield("/tp Fort Jobb")
yield("/qst next 3384") --Imperative Repairs
yield("/qst start")

while IsQuestComplete(3384) == false do
    yield("/wait 1")
end

yield("/qst next 3386") --An Unreasonable Request
yield("/qst start")

while IsQuestComplete(3386) == false do
    yield("/wait 1")
end

yield("/qst next 3385") --The Astute Amaro
yield("/qst start")

while IsQuestComplete(3385) == false do
    yield("/wait 1")
end
yield("/tp Wright")
yield("/qst next 3371") --Village of Woe
yield("/qst start")

while IsQuestComplete(3371) == false do
    yield("/wait 1")
end

yield("/qst next 3360") --A Plankless Task
yield("/qst start")

while IsQuestComplete(3360) == false do
    yield("/wait 1")
end

yield("/qst next 3556") --A Disagreeable Dwarf
yield("/qst start")

while IsQuestComplete(3556) == false do
    yield("/wait 1")
end

yield("/qst next 3537") --Fugitive of Fear
yield("/qst start")

while IsQuestComplete(3537) == false do
    yield("/wait 1")
end
yield("/tp Mord Souq")
yield("/qst next 3375") --Work to Live or Live to Work
yield("/qst start")

while IsQuestComplete(3375) == false do
    yield("/wait 1")
end

yield("/qst next 3525") --A Vein Pursuit
yield("/qst start")

while IsQuestComplete(3525) == false do
    yield("/wait 1")
end

yield("/qst next 3503") --Scavengers Assemble
yield("/qst start")

while IsQuestComplete(3503) == false do
    yield("/wait 1")
end

yield("/qst next 3511") --Charmless Man
yield("/qst start")

while IsQuestComplete(3511) == false do
    yield("/wait 1")
end
yield("/tp Lydha Lran ")
yield("/qst next 3404") --The Path to Popularity
yield("/qst start")

while IsQuestComplete(3404) == false do
    yield("/wait 1")
end

yield("/qst next 3395") --The Forbidden Lran
yield("/qst start")

while IsQuestComplete(3395) == false do
    yield("/wait 1")
end

yield("/qst next 3398") --Delightful Decorations
yield("/qst start")

while IsQuestComplete(3398) == false do
    yield("/wait 1")
end

yield("/qst next 3427") --A New Amaro
yield("/qst start")

while IsQuestComplete(3427) == false do
    yield("/wait 1")
end
yield("/tp Slitherbough")
yield("/qst next 3478") --Stand on Ceremony
yield("/qst start")

while IsQuestComplete(3478) == false do
    yield("/wait 1")
end

yield("/qst next 3444") --What We Do for Family
yield("/qst start")

while IsQuestComplete(3444) == false do
    yield("/wait 1")
end

yield("/qst next 3467") --Suit Up
yield("/qst start")

while IsQuestComplete(3467) == false do
    yield("/wait 1")
end

yield("/qst next 3656") --The Great Deceiver
yield("/qst start")

while IsQuestComplete(3656) == false do
    yield("/wait 1")
end
yield("/tp The Ondo Cups")
yield("/qst next 3588") --Koal of the Cups
yield("/qst start")

while IsQuestComplete(3588) == false do
    yield("/wait 1")
end

yield("/qst next 3592") --Responsible Creation
yield("/qst start")

while IsQuestComplete(3592) == false do
    yield("/wait 1")
end

yield("/qst next 3593") --Debate and Discourse
yield("/qst start")

while IsQuestComplete(3593) == false do
    yield("/wait 1")
end

yield("/qst next 3594") --Community Cohesion
yield("/qst start")

while IsQuestComplete(3594) == false do
    yield("/wait 1")
end
yield("/tp Radz-at-Han")
yield("/qst next 4203") --Alchemist or Dancer
yield("/qst start")

while IsQuestComplete(4203) == false do
    yield("/wait 1")
end
yield("/tp Aporia")
yield("/qst next 4320") --Gleaner's Wish
yield("/qst start")

while IsQuestComplete(4320) == false do
    yield("/wait 1")
end

yield("/qst next 4480") --Lost Little Troll
yield("/qst start")

while IsQuestComplete(4480) == false do
    yield("/wait 1")
end

yield("/qst next 4484") --The Lad in Labyrinthos
yield("/qst start")

while IsQuestComplete(4484) == false do
    yield("/wait 1")
end

yield("/qst next 4329") --Let the Good Times Troll
yield("/qst start")

while IsQuestComplete(4329) == false do
    yield("/wait 1")
end
yield("/tp Yedlihmad")
yield("/qst next 4259") --Radiant Patrol
yield("/qst start")

while IsQuestComplete(4259) == false do
    yield("/wait 1")
end

yield("/qst next 4494") --Curing What Ails
yield("/qst start")

while IsQuestComplete(4494) == false do
    yield("/wait 1")
end

yield("/qst next 4489") --Steppe Child
yield("/qst start")

while IsQuestComplete(4489) == false do
    yield("/wait 1")
end
yield("/tp Camp Brokenglass")
yield("/qst next 4216") --Best Delivered Cold
yield("/qst start")

while IsQuestComplete(4216) == false do
    yield("/wait 1")
end

yield("/qst next 4232") --Children Are Our Future
yield("/qst start")

while IsQuestComplete(4232) == false do
    yield("/wait 1")
end

yield("/qst next 4498") --In Pursuit of Power
yield("/qst start")

while IsQuestComplete(4498) == false do
    yield("/wait 1")
end

yield("/qst next 4502") --Stranded at the Station
yield("/qst start")

while IsQuestComplete(4502) == false do
    yield("/wait 1")
end
yield("/tp Bestways Burrow")
yield("/qst next 4240") --True Carrot Crimes
yield("/qst start")

while IsQuestComplete(4240) == false do
    yield("/wait 1")
end

yield("/qst next 4241") --Carrots: It's What's for Dinner
yield("/qst start")

while IsQuestComplete(4241) == false do
    yield("/wait 1")
end

yield("/qst next 4253") --Alluring Allag
yield("/qst start")

while IsQuestComplete(4253) == false do
    yield("/wait 1")
end

yield("/qst next 4516") --Name That Way
yield("/qst start")

while IsQuestComplete(4516) == false do
    yield("/wait 1")
end
yield("/tp Anagnorisis")
yield("/qst next 4288") --You and the Ailouros
yield("/qst start")

while IsQuestComplete(4288) == false do
    yield("/wait 1")
end

yield("/qst next 4507") --Touring Anagnorisis, Part I
yield("/qst start")

while IsQuestComplete(4507) == false do
    yield("/wait 1")
end

yield("/qst next 4511") --An Expected Guest
yield("/qst start")

while IsQuestComplete(4511) == false do
    yield("/wait 1")
end

yield("/qst next 4313") --The Perks of Being a Lost Flower
yield("/qst start")

while IsQuestComplete(4313) == false do
    yield("/wait 1")
end
yield("/tp Reah Tahra")
yield("/qst next 4342") --Ending as One
yield("/qst start")

while IsQuestComplete(4342) == false do
    yield("/wait 1")
end

yield("/qst next 4346") --A Most Stimulating Discussion
yield("/qst start")

while IsQuestComplete(4346) == false do
    yield("/wait 1")
end

yield("/qst next 4354") --Combat Evolved
yield("/qst start")

while IsQuestComplete(4354) == false do
    yield("/wait 1")
end

yield("/qst next 4355") --Learn to Love
yield("/qst start")

while IsQuestComplete(4355) == false do
    yield("/wait 1")
end
yield("/tp Wachunpelo")
yield("/qst next 5039") --A Traveler to the Rescue
yield("/qst start")

while IsQuestComplete(5039) == false do
    yield("/wait 1")
end

yield("/qst next 5047") --An Illuminating Ritual
yield("/qst start")

while IsQuestComplete(5047) == false do
    yield("/wait 1")
end

yield("/qst next 5051") --A Crisis of Corruption
yield("/qst start")

while IsQuestComplete(5051) == false do
    yield("/wait 1")
end

yield("/qst next 5055") --The Flame Burns No More
yield("/qst start")

while IsQuestComplete(5055) == false do
    yield("/wait 1")
end
yield("/tp Ok'hanu")
yield("/qst next 5064") --Ripe for the Offering
yield("/qst start")

while IsQuestComplete(5064) == false do
    yield("/wait 1")
end

yield("/qst next 5074") --Divine Inspiration
yield("/qst start")

while IsQuestComplete(5074) == false do
    yield("/wait 1")
end

yield("/qst next 5081") --Rite of the Wind's Chosen
yield("/qst start")

while IsQuestComplete(5081) == false do
    yield("/wait 1")
end

yield("/qst next 5085") --All Good Potpacts Must Come to an End
yield("/qst start")

while IsQuestComplete(5085) == false do
    yield("/wait 1")
end
yield("/tp  Iq Br'aax")
yield("/qst next 5094") --Secrets in the Cinderfield
yield("/qst start")

while IsQuestComplete(5094) == false do
    yield("/wait 1")
end

yield("/qst next 5103") --Beast of the Heartlands
yield("/qst start")

while IsQuestComplete(5103) == false do
    yield("/wait 1")
end

yield("/qst next 5110") --Aiming High
yield("/qst start")

while IsQuestComplete(5110) == false do
    yield("/wait 1")
end

yield("/qst next 5114") --Lost and Powerless
yield("/qst start")

while IsQuestComplete(5114) == false do
    yield("/wait 1")
end
yield("/tp Hhusatahwi")
yield("/qst next 5130") --Meeting of the Spirits
yield("/qst start")

while IsQuestComplete(5130) == false do
    yield("/wait 1")
end

yield("/qst next 5138") --Rroneek Seeker
yield("/qst start")

while IsQuestComplete(5138) == false do
    yield("/wait 1")
end

yield("/qst next 5140") --When the Bill Comes Due
yield("/qst start")

while IsQuestComplete(5140) == false do
    yield("/wait 1")
end

yield("/qst next 5144") --A Bad Case of the Blue Devils
yield("/qst start")

while IsQuestComplete(5144) == false do
    yield("/wait 1")
end
yield("/tp Yyasulani Station")
yield("/qst next 5153") --Stressed Testing
yield("/qst start")

while IsQuestComplete(5153) == false do
    yield("/wait 1")
end

yield("/qst next 5156") --Phyt for Survival
yield("/qst start")

while IsQuestComplete(5156) == false do
    yield("/wait 1")
end

yield("/qst next 5159") --He Who Remembers
yield("/qst start")

while IsQuestComplete(5159) == false do
    yield("/wait 1")
end

yield("/qst next 5160") --Aunty Knows Best
yield("/qst start")

while IsQuestComplete(5160) == false do
    yield("/wait 1")
end
yield("/tp Leynode Mnemo")
yield("/qst next 5174") --Well-wishing at the Wishing Well
yield("/qst start")

while IsQuestComplete(5174) == false do
    yield("/wait 1")
end

yield("/qst next 5176") --Perplexing Puzzles, Endless Fun
yield("/qst start")

while IsQuestComplete(5176) == false do
    yield("/wait 1")
end

yield("/qst next 5178") --Volcanic Disruptions
yield("/qst start")

while IsQuestComplete(5178) == false do
    yield("/wait 1")
end

yield("/qst next 5179") --Blueprint Protocol
yield("/qst start")

while IsQuestComplete(5179) == false do
    yield("/wait 1")
end
