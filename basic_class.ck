/*public class First{
    fun void hi(){
        <<<"hi">>>;
    }
}*/
public class Basic
{
    //function to create harmonies based on interval from do
    fun int[] harmonize(int notes[], int interval){
        int out[notes.size()];
        for( int i; i < notes.cap(); i++ ){
            notes[i] + interval => out[i];
        }
        return out;
    }
    //basic play function
    fun void play( float note, float velocity ){
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
}

