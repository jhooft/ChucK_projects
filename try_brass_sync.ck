// patch
Brass brass => dac;
//.75 => r.gain;
//.05 => r.mix;

// our notes
[63, 64, 65, 66, 67, 68, 69, 70, 71 ] @=> int notes[];

//here comes the bride    MIDI middle C = 60??
[0, 5,5,5,0,7,4,5 ] @=> int bride_tune[];
//bride harmony
[5, 9,9,9,7,10,10,9 ] @=> int bride_harm[];

// infinite time-loop
while( true )
{
    // set
    //Math.random2f( 0, 1 ) => brass.lip;
    
    //Math.random2f( 0, 1 ) => brass.slide;
    
    //Math.random2f( 0, 12 ) => brass.vibratoFreq;
    
    //Math.random2f( 0, 1 ) => brass.vibratoGain;
    0.025 => brass.vibratoGain;
    //Math.random2f( 0, 1 ) => brass.volume;
    .8 => brass.volume;

    // print
    <<< "---", "" >>>;
    <<< "lip tension:", brass.lip() >>>;
    <<< "slide length:", brass.slide() >>>;
    <<< "vibrato freq:", brass.vibratoFreq() >>>;
    <<< "vibrato gain:", brass.vibratoGain() >>>;
    <<< "volume:", brass.volume() >>>;

    /*for( int i; i < bride_tune.cap(); i++ )
    {
        play( 60 + bride_tune[i], .1 );
        500::ms => now;
    }*/
    
    //for( int i; i < bride_tune.cap(); i++ )
    //{
        play(60+bride_tune[0],.1);
        .8::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[1],.1);
        .55::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[2],.1);
        .05::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[3],.1);
        1.8::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[4],.1);
        .8::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[5],.1);
        .55::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[6],.1);
        .05::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
        play(60+bride_tune[7],.1);
        1.8::second => now;
        brass =< dac;
        .2::second => now;
        brass => dac;
       
        
        //play( 60 + bride_tune[i], .1 );
        //500::ms => now;
    //}
}
// basic play function (add more arguments as needed)
fun void play( float note, float velocity )
{
    // start the note
    Std.mtof( note ) => brass.freq;
    velocity => brass.noteOn;
}