extends Node

var sound_effect_dict = {}

@export var sound_effect_settings : Array[SoundEffectSettings]

func _ready():
	for sound_effect_setting : SoundEffectSettings in sound_effect_settings:
		sound_effect_dict[sound_effect_setting.type] = sound_effect_setting
		
	
func create_2d_audio_at_location(location, type : SoundEffectSettings.SOUND_EFFECT_TYPE):
	if sound_effect_dict.has(type):
		var sound_effect_setting : SoundEffectSettings = sound_effect_dict[type]
		if sound_effect_setting.has_open_limit():
			sound_effect_setting.change_audio_count(1)
			var new_2D_audio = AudioStreamPlayer2D.new()
			add_child(new_2D_audio)
			
			new_2D_audio.position = location
			new_2D_audio.stream = sound_effect_setting.sound_effect
			new_2D_audio.volume_db = sound_effect_setting.volume
			new_2D_audio.pitch_scale = sound_effect_setting.pitch_scale
			new_2D_audio.pitch_scale += Global.rng.randf_range(-sound_effect_setting.pitch_randomness, sound_effect_setting.pitch_randomness )
			new_2D_audio.finished.connect(sound_effect_setting.on_audio_finished)
			new_2D_audio.finished.connect(new_2D_audio.queue_free)
			
			new_2D_audio.play()
			

	else:
		push_error("Audio Manager failed to find setting for type ", type)
		
		
func create_audio(type : SoundEffectSettings.SOUND_EFFECT_TYPE):
	if sound_effect_dict.has(type):
		var sound_effect_setting : SoundEffectSettings = sound_effect_dict[type]
		if sound_effect_setting.has_open_limit():
			sound_effect_setting.change_audio_count(1)
			var new_audio = AudioStreamPlayer.new()
			add_child(new_audio)

			new_audio.stream = sound_effect_setting.sound_effect
			new_audio.volume_db = sound_effect_setting.volume
			new_audio.pitch_scale = sound_effect_setting.pitch_scale
			new_audio.pitch_scale += Global.rng.randf_range(-sound_effect_setting.pitch_randomness, sound_effect_setting.pitch_randomness )
			new_audio.finished.connect(sound_effect_setting.on_audio_finished)
			new_audio.finished.connect(new_audio.queue_free)
			
			new_audio.play()
	else:
		push_error("Audio Manager failed to find setting for type ", type)
