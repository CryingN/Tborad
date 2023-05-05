shader_type canvas_item;

uniform vec4 deep_color : hint_color;
uniform vec4 light_color : hint_color;
uniform float number;

void fragment(){
	if (floor(mod(UV.y * number, 2.0)) < 0.001){
		COLOR = deep_color;
	}else{
		COLOR = light_color;
	}
}