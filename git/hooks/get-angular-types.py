import re
import sys

angular_pattern = r'.*\ ([a-z]*)\((.*)\)\:.*'

if __name__ == '__main__':
    git_log = sys.stdin.read()

    stuffs = {};
    
    # builds the object
    for line in git_log.split('\n'):
        matches = re.match(angular_pattern,line)
        if matches:
            if not matches.group(1) in stuffs:
                stuffs[matches.group(1)] = [ ]
            
            if not matches.group(2) in stuffs[matches.group(1)]:
                stuffs[matches.group(1)].append(matches.group(2))
    
    # sorts it
    for part in stuffs:
        stuffs[part].sort()

    # builds the string
    output = "";
    for part in stuffs:
        output += part + "("
        for word in stuffs[part]:
            output += word + ", "
        output = output[:-2]
        output += ")"
        

        print("# " + output)
	output = ""
