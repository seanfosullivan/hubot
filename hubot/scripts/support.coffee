module.exports = (robot) ->
 robot.respond /support/i, (msg) ->

   out = []
   out[0] = ""
   out[1] = "robot remember Q. ... A. ... -> Remembers the Q&A"
   out[2] = "robot Q. ... -> Question asked robot responds with A. ..."
   out[3] = "robot joke me -> robot returns random joke"
   out[4] = "robot learn me (news, nto, life tips, tech, science, TIL?) -> defaults to random of them, nto=nottheonion."
   out[5] = "robot reddit me (?) -> defaults to r/all (?)= any subbreddit. Returns random top from subreddit."
   out[6] = "robot reddit top (subreddit?) (number of posts returned) -> returns list of top posts."
   out[7] = "robot catfact -> Returns a catfact."
   out[8] = "robot directions (Origin) (Destination) -> Directions from origin to destination."
   out[9] = "robot 8ball ... -> ask the magic eight ball a question."
   out[10] = "robot wiki ... -> does a wiki search for input."
      
   for item in out
     msg.send item
