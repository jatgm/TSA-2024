shader_type canvas_item;

uniform vec4 flash_color : source_color = vec4(1.0);
uniform float opacity : hint_range(0.0, 1.0) = .5;

// fragment runs on every pixel on the sprite and determinse what color it should be 
void fragment() {
	vec4 hcolor = vec4(255,255,255,0);
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, flash_color.rgb, opacity);
	COLOR = color;
}
