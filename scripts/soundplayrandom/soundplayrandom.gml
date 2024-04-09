
function SoundPlayRandom(sounds,pitchRange,volume){
	var sound;
	if (typeof(sounds) == "array") {
		sound = sounds[irandom(array_length(sounds)-1)];
	} else {
		sound = sounds;
	}
	
	audio_play_sound(sound,0,false);
	
	if (typeof(pitchRange) == "array") {
		audio_sound_pitch(sound,random_range(pitchRange[0],pitchRange[1]));
	} else {
		audio_sound_pitch(sound,pitchRange);
	}
	audio_sound_gain(sound,global.settings.volumeMaster*global.settings.volumeEffects*volume,0);
}