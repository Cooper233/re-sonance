shader_type canvas_item;

void fragment() {
	vec4 txt=texture(TEXTURE,UV);
	if(UV.x<=0.1){
		txt.a=0.0;
	}
	else if(UV.x<=0.6){
		txt.a*=(UV.x-0.1)/0.5;
	}
	COLOR=txt;
}
