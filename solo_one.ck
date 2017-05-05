//basic solo one

Rhodey piano => dac;
//Brass brass => dac;

//grab from command line
//<<<me.arg(1)>>>;
Std.atoi(me.arg(0)) => int octave;    //octave = 48 usually ( 36, 60?)
Std.atoi(me.arg(1)) => int key;      //key = 0...C so far


[0,0,0,0,5,5,0,0,7,5,0,0] @=> int bottom[];
//basic blues scale
//[0,3,5,6,7,10,12]

//scale up down
[0,3,5,6,7,6,5,3] @=> int scaleupdown[];



//function to create harmonies based on interval from do
fun int[] harmonize(int notes[], int interval){
    int out[notes.size()];
    for( int i; i < notes.cap(); i++ ){
        notes[i] + interval => out[i];
        //<<<out[i]>>>;
    }
    return out;
}

harmonize(scaleupdown, 5) @=> int scaleupdown5[];
harmonize(scaleupdown, 7) @=> int scaleupdown7[];




// basic play function (add more arguments as needed)
/*
fun void play( float note, float velocity )
{
    // start the note
    Std.mtof( note ) => brass.freq;
    velocity => brass.noteOn;
}*/




// piano solo - blues scales
while(true){
    for(int k;k<4;k++){
        playonebar(scaleupdown, octave);
    }
    for(int k;k<2;k++){
        playonebar(scaleupdown5, octave);
    }
    for(int k;k<2;k++){
        playonebar(scaleupdown, octave);
    }
    playonebar(scaleupdown7, octave);
    playonebar(scaleupdown5, octave);
    for(int k;k<2;k++){
        playonebar(scaleupdown,octave);
    }
    
}
fun void play( float note, float velocity )
{
    // start the note
    Std.mtof( note ) => piano.freq;
    velocity => piano.noteOn;
}

fun void playonebar( int notes[], int octave){
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

/*
while(true){

        for(int k;k<4;k++){
        play(60+scaleupdown[0],.075);
        .345::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[1],.1);
        .095::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[2],.1);
        .345::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[3],.1);
        .095::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[4],.1);
        .345::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[5],.1);
        .095::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[6],.1);
        .345::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
        play(60+scaleupdown[7],.1);
        .095::second => now;
        brass =< dac;
        .03::second => now;
        brass => dac;
    }//end for - first four bars
    
}*/