# ChucK_projects
Music-based projects using the ChucK programming language.

[ChucK](http://chuck.cs.princeton.edu/) is designed/intended as a 'real-time' programming language, particularly for use in on-the-fly performance programming and music synthesis. You can view and listen to one example of its intended implementations [here](https://www.youtube.com/watch?v=GSGKEy8vHqg). The files in this repo constitute a blatant abuse of the platform for purposes of quickly hacking together my competition submission for WSU Crimson Code Hackathon 2017. As of now (May 2017) its a mess ranging from badly overloaded to completely uncalled functions, with no clear file dependency structure to foreign eyes. 

The basic idea of the project is to randomly generate a jazz improv solo. During the hackathon, I did not have time to implement multiple instrument voices or percussion. It can currently only operate in the 'piano' voice backed up by a twelve bar blues comp. As I have time to come back to this, I will clean up and compartmentalize into classes, teach the program new licks, more carefully implement key changes, and work in different instrumental voices. Also, I need a more elegant solution for syncopation, as my quick hack version is too code-heavy and not conducive to smooth audio playback. 
