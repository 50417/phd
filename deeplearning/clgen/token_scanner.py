from absl import app

from os import listdir
from os.path import isfile, join

# Generated dictionaries' filename
dic = 'dics.txt'
token = 'tokens.txt'
# Path to corpus database
mypath = './tests/data/mdl/20mdl'


# insertdic will insert the input keywords into selected dictionary.
# Args:
#   kw: keyword string which is going to be saved
#   dicnum: the index of dictionary going to be used, 0 for keywords dictionary, 1 for parameter dictionary
def insertdic(kw:str):
    with open(dic, 'a+') as myfile:
        myfile.write(kw + '\n')


# iscontain will return whether the keywords is stored in the dictionary or not.
# Args:
#   kw: keyword string which is going to be checked
#   dicnum: the index of dictionary going to be used, 0 for keywords dictionary, 1 for parameter dictionary
#
# Returns:
#   1 for the keyword is already in the dictionary, 0 for not in the dictionary
def iscontain(kw:str):
    with open(dic, 'r') as myfile:
        data = myfile.read().split('\n')
        for l in data:
            if l == kw:
                return 1
        return 0

def main(argv):
    """Main entry point."""
    open(dic, 'w').close()
    if len(argv) > 1:
        raise app.UsageError(
            "Unrecognized command line options: '{}'".format(' '.join(argv[1:])))

    for f in listdir(mypath):
        tmpf = join(mypath, f)
        if isfile(tmpf):
            myfile = open(tmpf, 'r')
            data = myfile.read().split('\n')
            for l in data:
                l = l.replace('\t', ' ').lstrip()
                split_pos = l.find('\"')
                if split_pos == -1:
                    split_pos = l.find('[')
                if split_pos != -1:
                    lstr, rstr = l[:split_pos], l[split_pos:]
                    w = lstr.split(' ')
                    w.append(str(rstr))
                    #lstr=lstr.translate({ord(c): None for c in ' '})
                else:
                    w = l.split(' ')

                w = list(filter(None, w))
                if '{' in w or '}' in w:
                    continue
                if len(w) == 1:
                    print("err: only one element in " + l)
                    continue
                elif len(w) == 2:
                    if iscontain(w[0]) == 0:
                        insertdic(w[0])
                    if w[1].startswith('\"') and w[1].endswith('\"'):
                        if iscontain(w[1].replace('\"', '')) == 0:
                            insertdic(w[1].replace('\"', ''))
                elif len(w) == 0:
                    continue
                else:
                    print('err: ' + str(len(w)) + ' elements in ' + l)

    with open(dic, 'r') as myfile:
        data = myfile.read().split('\n')
        with open(token, 'w') as myfilewrite:
            for l in data:
                myfilewrite.write('      tokens: "' + l + '"\n')

if __name__ == '__main__':
    app.run(main)
