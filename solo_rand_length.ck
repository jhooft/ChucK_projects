


Rhodey piano => dac;
Std.atoi(me.arg(0)) => int octave;    //octave = 48 usually ( 36, 60?)
if(octave==0){
    60=>octave;
}
Std.atoi(me.arg(1)) => int key;      //key = 0...C so far
//select solo randomly from basic blues scale

//basic blues scale
[0,3,5,6,7,10,12] @=> int bluesscale[];
//make a bar of randomly ordered bluesscale notes
//makebar(bluesscale) @=> int randbar[12];

//scale up down
[0,3,5,6,7,6,5,3] @=> int scaleupdown[];

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
            playrandlength(makebar(notes), octave);
        }
        for(int k;k<2;k++){
            playrandlength(harmonize(makebar(notes),5), octave);
        }
        for(int k;k<2;k++){
            playrandlength(makebar(notes), octave);
        }
        playrandlength(harmonize(makebar(notes),7), octave);
        playrandlength(harmonize(makebar(notes),5), octave);
        for(int k;k<2;k++){
            playrandlength(makebar(notes),octave);
        }
    
}//end func playtwelve

fun void playrandlength( int notes[], int octave){//plays notes/silence randomly in swing
    for(int i;i<7;2 +=> i){    
        Math.random()%2 => int r;
        if(r==0){  
            play(octave+notes[i],.075);//note on front swing
            .345::second => now;
            Math.random()%2 => r;
            if(r==0){
                play(octave+notes[i],.075);//continuous note
                .03::second => now;
            }
            else{
                piano =< dac;
                .03::second => now;//broken note
                piano => dac;
            }
        }
        else{
            piano =< dac;
            .375::second => now;//silence on front swing
            piano => dac;
            
        }    
        
        Math.random()%3 => r;
        if(r==0){
            play(octave+notes[i],.1);//stay on prev note back swing
            .095::second => now;
        }
        else if(r==1){
            play(octave+notes[i+1],.1);//next note back swing
            .095::second => now;
        }
        Math.random()%2 => int s;
        if(s==0){
            play(octave+notes[i+1],.1);//continuous note
            .03::second => now;
        }
        else{
            piano =< dac;
            .03::second => now;//broken note
            piano => dac;
        }
        if(r==2){
            piano =< dac;
            .125::second => now;//silence back swing
            piano => dac;
        }
    }//end for            
}//end func playrandlength

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