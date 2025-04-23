shader_type canvas_item;


uniform float alpha=1.0;

void fragment() {
	vec4 text=texture(TEXTURE,UV);
	text.a*=alpha;
	COLOR=text;
}
