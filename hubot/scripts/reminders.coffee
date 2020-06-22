module.exports = (robot) ->
  
  robot.brain.data.List =
    toDo: {},
    completed: {}
  List =
    get: ->
      Object.keys(robot.brain.data.List.toDo)
    
    getCompleted: ->
      Object.keys(robot.brain.data.List.completed)
      
    add: (item) ->
      robot.brain.data.List.toDo[item] = true
      
    remove: (item) ->
      delete robot.brain.data.List.toDo[item]
      true
      
    completed: (item) ->
      delete robot.brain.data.List.toDo[item]
      robot.brain.data.List.completed[item] = true
      
  robot.respond /reminders$/i, (msg) ->
    list = List.get().join("\n") || "No items in your Reminders."
    msg.send list
  
  robot.respond /remind me (.*)/i, (msg) ->
    item = msg.match[1].trim()
    List.add item
    msg.send "ok, added #{item} to your Reminders"

  robot.respond /i did (.*)/i, (msg) ->
    item = msg.match[1].trim()
    List.completed item
    msg.send "ok, marked #{item} as completed."
  
  robot.respond /remove (.*)/i, (msg) ->
    item = msg.match[1].trim()
    List.remove item
    msg.send "ok, removed #{item} from your Reminders."
  
  robot.respond /what have i completed/i, (msg) ->
    list = List.getCompleted().join("\n") || "You haven't done anything you waster."
    msg.send list
