Rhodey piano => dac;

[0,0,0,0,5,5,0,0,7,5,0,0] @=> int bottom[];



//function to create harmonies based on interval from do
fun int[] harmonize(int notes[], int interval){
    int out[notes.size()];
    for( int i; i < notes.cap(); i++ ){
        notes[i] + interval => out[i];
        //<<<out[i]>>>;
    }
    return out;
}

harmonize(bottom, 4) @=> int mi[];
/*for(int j;j < mi.cap();j++){
<<<mi[j]>>>;}
<<<mi[0]>>>;*/
harmonize(bottom, 7) @=> int so[];
harmonize(bottom, 10) @=> int flat[];
while(true){
    for( int i; i < bottom.cap(); i++ )
        {
            play( 48 + flat[i], .1 );
            2::second => now;
        }
    }
// basic play function (add more arguments as needed)
fun void play( float note, float velocity )
{
    // start the note
    Std.mtof( note ) => piano.freq;
    velocity => piano.noteOn;
}