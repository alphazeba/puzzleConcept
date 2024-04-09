function SoundPlay(sound,pitch,loop,volume,priority=0) {
	if (global.settings.volumeMute) {
		return;
	}

	audio_play_sound(sound,priority,loop);
	audio_sound_pitch(sound,pitch);
	audio_sound_gain(sound,global.settings.volumeMaster*global.settings.volumeEffects*volume,0);
}

function SoundGain(sound,volume,time) {
	audio_sound_gain(sound,global.settings.volumeMaster*global.settings.volumeEffects*volume,time);
}