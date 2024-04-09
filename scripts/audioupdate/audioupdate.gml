function AudioUpdate(){
	if (instance_exists(AudioManager)) {
		audio_sound_gain(AudioManager.musicPlaying,global.settings.volumeMaster*global.settings.volumeMusic*AudioManager.musicVolume,0);
	}
}