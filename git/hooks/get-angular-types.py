import re
import sys

angular_pattern = r'.{8}([^\ \(\)]*):.*'
angular_pattern_topic = r'.{8}([^\ ]*)\((.*)\):.*'

if __name__ == '__main__':
    git_log = sys.stdin.read()

    stuffs = {};
    
    # builds the object
    for line in git_log.split('\n'):
        matches = re.match(angular_pattern_topic,line)
        matches_no_topic = re.match(angular_pattern,line)
        
        if matches:
            if not matches.group(1) in stuffs:
                stuffs[matches.group(1)] = [ ]
            
            if not matches.group(2) in stuffs[matches.group(1)]:
                stuffs[matches.group(1)].append(matches.group(2))
        
        if matches_no_topic:
            if not matches_no_topic.group(1) in stuffs:
                stuffs[matches_no_topic.group(1)] = [ ]
    
    # builds list of parts
    stuffHeaders = []
    for part in stuffs:
        stuffHeaders.append(part);

    # sorts it
    stuffHeaders.sort();
    for part in stuffs:
        stuffs[part].sort()

    # builds the string
    output = "";
    for part in stuffHeaders:
        output += part
        if len(stuffs[part]) > 0:
            output += "("
            for word in stuffs[part]:
                output += word + ", "
            output = output[:-2]
            output += ")"
        

        print("# " + output)
	output = ""
