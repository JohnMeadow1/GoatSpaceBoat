shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	float f1 = max(0,(pow(sin((UV.y*40.0 + UV.x*5.0-TIME*22.0)/6.0),4)));
	if (color.r >0.9)
	{
		color.rgb = vec3(f1) + color.rgb;
	}
	COLOR = color;
}