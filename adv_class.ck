//First firstone;
//firstone.hi();
//reachfun(firstone);
/*fun void reachfun(First thing){
    thing.hi();
}*/
Rhodey piano => dac;
Std.atoi(me.arg(0)) => int octave;    //octave = 48 usually ( 36, 60?)
if(octave==0){
    60 => octave;}
Std.atoi(me.arg(1)) => int key;      //key = 0...C so far
    
//basic blues scale
[0,3,5,6,7,10,12] @=> int bluesscale[];

while(true){
    
    do_a_dear(octave,key);
    playonebar(makebar(bluesscale), octave);
    playonebar(makebar(bluesscale), octave);
    playonebar(makebar(bluesscale), octave);
    playonebar(harmonize(makebar(bluesscale),5), octave);
    playonebar(harmonize(makebar(bluesscale),5), octave);
    playonebar(makebar(bluesscale), octave);
    playonebar(makebar(bluesscale), octave);
    playonebar(harmonize(makebar(bluesscale),7), octave);
    playonebar(harmonize(makebar(bluesscale),5), octave);
    flintstones(octave, key);
    //playtwelverand(bluesscale,octave,key);
}




//length_combo function
fun void length_combo(int note, int combo, int octave, int key){
    //<<<"length_combo was called!">>>;
    (octave + key + note) => int n;
    //whole
    if(combo==0){
        play(n,.075);
        .97::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    //half half
    if(combo==1){
        play(n,.075);
        .47::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .47::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    
    //q q q q
    if(combo==2){
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    
    //half q q
    if(combo==3){
        play(n,.075);
        .47::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    
    //q half q
    if(combo==4){
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .47::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    
    //dhalf q
    if(combo==5){
        play(n,.075);
        .72::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(n,.075);
        .22::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;}
    //ssssssss
    //ss half ss
    
}//end func length_combo

fun void playtwelverand(int notes[],int octave,int key){
    int rand;
    for(int k;k<4;k++){//bars 1-4
        Math.random()%9 => rand;
        <<<k," ",rand>>>;    
        if (rand==6){
            playonebar(makebar(notes), octave);
        }
        if(rand==7){
            if(k<3){
                flintstones(octave,key);
            }
            else{
                playonebar(makebar(notes), octave);
            }
        }
        if(rand==8){
            if(k<3){
                do_a_deer(octave,key);
            }
            else{
                playonebar(makebar(notes), octave);
            }
        }
        if(rand>=0 && rand<=5){
            Math.random()%notes.size() => int show;
            <<<"note in",show,rand>>>;
            length_combo(notes[show],rand,octave,key);
        }
    }//end for    
    for(int k;k<2;k++){//bars 5,6
        Math.random()%7=>rand;
        <<<k," ",rand>>>;
        if (rand==6){
            playonebar(harmonize(makebar(notes),5), octave);
        }
        if(rand>=0 && rand<=5){
            length_combo(harmonize(notes,5)[Math.random()%notes.size()],rand,octave,key);
        }    
    }//end for 
    for(int k;k<2;k++){//bars 7,8
        Math.random()%7=>rand;
        <<<k," ",rand>>>;
        if(rand==6){
            playonebar(makebar(notes), octave);
        }
        else if(rand>=0 && rand<=5){
            length_combo(notes[Math.random()%notes.size()],rand,octave,key);
        }
    }//end for
    Math.random()%7=>rand;//bar 9
    <<<rand>>>;
    if (rand==6){
        playonebar(harmonize(makebar(notes),7), octave);
    }
    else if(rand>=0 && rand<=5){
        length_combo(harmonize(notes,7)[Math.random()%notes.size()-1],rand,octave,key);
    }
    Math.random()%7=>rand;//bar 10
    <<<rand>>>;
    if (rand==6){
        playonebar(harmonize(makebar(notes),5), octave);
    }
    else if(rand>=0 && rand<=5){
        length_combo(harmonize(notes,5)[Math.random()%notes.size()-1],rand,octave,key);
    }   
    for(int k;k<2;k++){//bar 11,12
        Math.random()%7=>rand;
        <<<k," ",rand>>>;
        if(rand==6){
            playonebar(makebar(notes),octave);
        }
        else if(rand>=0 && rand<=5){
            length_combo(notes[Math.random()%notes.size()-1],rand,octave,key);
        }
    }//end for
    
}//end func playtwelverand




fun void flintstones(int octave, int key){
    play(octave+key+7,.075);
    .22::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+0,.075);
    (.625-.25-.03)::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+12,.075);
    (.875-.625-.03)::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+9,.075);
    (1-.875-.03)::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+7,.075);
    .22::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+0,.075);
    (1-.25-.03)::second => now;
}//end func flintstones

fun void do_a_deer(int octave, int key){
    piano =< dac;
    .125::second => now;
    piano => dac;
    play(octave+key+0,.075);
    (.375-.125)::second => now;
    play(octave+key+2,.075);
    (.5-.375-.03)::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+4,.075);
    (.875-.5-.03)::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+0,.075);
    (1-.875)::second => now;
    play(octave+key+4,.075);
    .22::second => now;
    piano =< dac;
    .03::second => now;
    piano => dac;
    play(octave+key+0,.075);
    (.25)::second => now;
    play(octave+key+4,.075);
    .125::second =>now;
    play(octave+key+10,.075);
    .125::second =>now;
    play(octave+key+9,.075);
    .125::second =>now;
    play(octave+key+10,.075);
    .0625::second =>now;
    /*play(octave+key+7,.075);
    .0625::second =>now;
    play(octave+key+6,.075);
    .0625::second =>now;
    play(octave+key+5,.075);
    .0625::second =>now;
    play(octave+key+3,.075);
    .0625::second =>now;*/
    
}//end func do_a_dear

fun void playonebar( int notes[], int octave){//plays notes in basic swing
        play(octave+notes[0],.075);
        .345::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[1],.1);
        .095::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[2],.1);
        .345::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[3],.1);
        .095::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[4],.1);
        .345::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[5],.1);
        .095::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[6],.1);
        .345::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
        play(octave+notes[7],.1);
        .095::second => now;
        piano =< dac;
        .03::second => now;
        piano => dac;
}//end func playonebar

//function to create harmonies based on interval from do
fun int[] harmonize(int notes[], int interval){
    int out[notes.size()];
    for( int i; i < notes.cap(); i++ ){
        notes[i] + interval => out[i];
        //<<<out[i]>>>;
    }
    return out;
}//end func harmonize

fun void play( float note, float velocity )
{
    // start the note
    Std.mtof( note ) => piano.freq;
    velocity => piano.noteOn;
}

fun int[] makebar(int notes[]){//makes a random arrangement of blues notes
    int outbar[8];
    0 => int k;
    while(k < 8){
        Math.random()%13 => int rnote;
        for(int j;j<notes.cap();j++){
            if(rnote==notes[j]){    //if the rand note is in notes[]
                rnote => outbar[k];
                k++;
            }
        }
    }
    return outbar;
}//end func makebar

//random swing piano solo - blues scales
/*fun void playtwelve(int notes[],int octave){
        for(int k;k<4;k++){
            playonebar(makebar(notes), octave);
        }
        for(int k;k<2;k++){
            playonebar(harmonize(makebar(notes),5), octave);
        }
        for(int k;k<2;k++){
            playonebar(makebar(notes), octave);
        }
        playonebar(harmonize(makebar(notes),7), octave);
        playonebar(harmonize(makebar(notes),5), octave);
        for(int k;k<2;k++){
            playonebar(makebar(notes),octave);
        }
    
}//end func playtwelve*/