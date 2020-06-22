#!/bin/python

import sys
from fuzzywuzzy import fuzz
from fuzzywuzzy import process


def pattern_match(msg):

    strings=[]
    results=[]
    with open("/home/hedge/mybot/hubot/database/knowledgebase.txt") as f:
        content = [x.strip('\n') for x in f.readlines()]
    for x in content:
        question = x.split("Q.")[1].split("A.")[0]
        answer = x.split("A.")[1]
        strings.append(question)
        results.append(answer)
    res = 0
    temp_res = 0
    index_counter = 0
    index_bestresult = 0
    for item in strings:
        temp_res = fuzz.token_set_ratio(item, msg)
        if res < temp_res:
            res = temp_res
            index_bestresult = index_counter
        index_counter+=1
    answer = results[index_bestresult]
    if res < 50:
        print "I'm only " + str(res) + "% sure about this one, maybe phrase that question differently?:"
    print answer

pattern_match(sys.argv)




