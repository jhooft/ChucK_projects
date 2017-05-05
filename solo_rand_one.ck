
Rhodey piano => dac;
Std.atoi(me.arg(0)) => int octave;    //octave = 48 usually ( 36, 60?)
if(octave==0){
    48 => octave;}
Std.atoi(me.arg(1)) => int key;      //key = 0...C so far
//select solo randomly from basic blues scale

//basic blues scale
[0,3,5,6,7,10,12] @=> int bluesscale[];
//make a bar of randomly ordered bluesscale notes
//makebar(bluesscale) @=> int randbar[12];
while(true){
    
    playtwelve(bluesscale,octave);
}

fun int[] makebar(int notes[]){
    //<<<notes.size()>>>;
    //<<<notes.cap()>>>;
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




//playonebar(randsolo, octave);
//random swing piano solo - blues scales
fun void playtwelve(int notes[],int octave){
    
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
    
}//end func playtwelve

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