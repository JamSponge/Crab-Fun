// PlaySoundWithCumulativePitch(sSound,5,5,5)

soundtoplay = argument0
pitchrate = argument1
minpitch = argument2
maxpitch = argument3
priority = argument4

if pitchrate > maxpitch {pitchrate = maxpitch}
if pitchrate < minpitch {pitchrate = minpitch}

var soundeffect = audio_play_sound_at(soundtoplay,x,y,0,200,800,1,false,priority);
 switch (pitchrate)
    {
    case 1: audio_sound_pitch(soundeffect, 0.6); break;
    case 2: audio_sound_pitch(soundeffect, 0.7); break;
    case 3: audio_sound_pitch(soundeffect, 0.8); break;
    case 4: audio_sound_pitch(soundeffect, 0.9); break;
    case 5: audio_sound_pitch(soundeffect, 1); break;
    case 6: audio_sound_pitch(soundeffect, 1.1); break;
    case 7: audio_sound_pitch(soundeffect, 1.2); break;
    case 8: audio_sound_pitch(soundeffect, 1.3); break;
    case 9: audio_sound_pitch(soundeffect, 1.4); break;
    case 10: audio_sound_pitch(soundeffect, 1.5); break;
    }
    
