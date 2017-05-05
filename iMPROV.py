import subprocess as sp

tmp=sp.call('cls',shell=True)

print "\n\n\n\n\n\n\n***************************************************************************"
print "***************************************************************************\n"
print "                         WELCOME TO iMPROV !!                          "
print "\n***************************************************************************"
print "***************************************************************************\n\n"
print("I will improvise a solo on a twelve bar blues according to your selections.\n")
print("I can also output a recording of the solo and accompaniment to a .wav file.")
print("Let's get started!\n\n\n")


print("Would you like a BEGINNER, INTERMEDIATE, or ADVANCED solo?\n")
levelin= raw_input("Enter b,i,a:  \n\n")
print("\n\nIn which KEY would you like your solo?")
key = raw_input("Choose C, Cs, D, Ds, E, F, Fs, G, Gs, A, As, B\n\n")

octavein = raw_input("\n\nPlease select an OCTAVE: 1 thru 7 (as on piano keyboard)\n\n")
record = raw_input("\n\nWould you like me to make a recording? (y/n)\n\n")
octave = int(octavein) * 12
if record=='y':
    if levelin=='b':
        cmd = ['chuck', 'solo_one.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck', 'recording_trial.ck:'+'rec1']
    elif levelin=='i':
        cmd = ['chuck', 'solo_rand_one.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck', 'recording_trial.ck:'+'rec2']
    else: #levelin=='a'
        cmd = ['chuck', 'adv_class.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck', 'recording_trial.ck:'+'rec3']
        
        
else: # record=='n':
    if levelin=='b':
        cmd = ['chuck', 'solo_one.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck']
    elif levelin=='i':
        cmd = ['chuck', 'solo_rand_one.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck']
    else: #levelin=='a'
        cmd = ['chuck', 'adv_class.ck:'+str(octave)+':'+key,'bluesbottom.ck','bluesmi.ck','bluesso.ck','bluesflat.ck','bluestop.ck']

process = sp.Popen(cmd)

print"\n\n\n\n Your solo is playing...\n\n\n\n"
