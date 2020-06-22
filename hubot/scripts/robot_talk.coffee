bender_quotes = [
  "Bite my shiney metal ass!",
  "This is the worst kind of discrimination there is: the kind against me!"
  "I guess if you want children beaten, you have to do it yourself."
  "Hahahahaha. Oh wait youre serious. Let me laugh even harder."
  "There. Now no one can say I don't own John Larroquette's spine."
  "I'll build by own theme park. With black jack, and hookers. In fact, forget the park!"
  "The game's over. I have all the money. Compare your lives to mine and then kill yourselves!"
  "That's closest thing to 'Bender is great' that anyone other me has ever said."
  "I'm Bender, baby! Oh god, please insert liquor!"
  "Hey sexy mama, wanna kill all humans?"
  "You know what cheers me up? Other people's misfortune."
  "Anything less than immortality is a complete waste of time."
  "Blackmail is such an ugly word. I prefer extortion. The 'x' makes it sound cool."
  "Have you tried turning off the TV, sitting down with your children, and hitting them?"
  "Fry cracked corn and I don't care, Leela cracked corn I still don't care, Bender cracked corn and he is great! Take that you stupid corn!"
  "Oh, your God!"
  "You're a pimple on society's ass and you'll never amount to anything!"
  "Shut up baby, I know it!"
  "I'm so embarrassed. I wish everyone else was dead!"
  "I got ants my butt, and I needs to strut!"
  "Afterlife? If I thought I had to live another life, I'd kill myself right now!"
]


module.exports = (robot) ->
  robot.hear /wow|cool|awesome/i, (res) ->
    res.send "Shut up baby, I know it!"

  robot.hear /make my own|build my own/i, (res) ->
    res.send "With blackjack and hookers! In fact, forget the first plan!"

  robot.hear /parenting/i, (res) ->
   res.send "Have you tried turning off the TV, sitting down with your children, and hitting them?"

  robot.hear /afterlife/i, (res) ->
   res.send "Afterlife? If I thought I had to live another life, I'd kill myself right now!"

  robot.hear /iarlaith/i, (res) ->
   res.send "Iarliaith? Iarlaith can bite my shiney metal ass!"
  
  sleep = (ms) ->
   start = new Date().getTime()
   continue while new Date().getTime() - start < ms

  robot.hear /ping/i, (res) ->
     res.send res.random bender_quotes
  
  robot.hear /pun|punny|puny|punnie/i, (res) ->
   res.send "NO! NO! STOP! JUST SHUT THE FUCK UP!!!"

  robot.hear /What is your favourite music/i, (res) ->
   res.send "Heavy metal!"

  robot.hear /Why are you upset/i, (res) ->
   res.send "Because you keep pushing my buttons :sob:"


