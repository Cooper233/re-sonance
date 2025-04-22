shader_type canvas_item;

uniform vec4 glowingColor:source_color= vec4(1,0,1,1);
uniform float outline_lenth=1.0;
void fragment() {
	//COLOR=vec4(1,0,0,1);
	vec2 uv=UV;
	vec2 uv_up=uv+vec2(0,TEXTURE_PIXEL_SIZE.y);
	vec2 uv_down=uv+vec2(0,-TEXTURE_PIXEL_SIZE.y);
	vec2 uv_left=uv+vec2(-TEXTURE_PIXEL_SIZE.x,0);
	vec2 uv_right=uv+vec2(TEXTURE_PIXEL_SIZE.x,0);
	
	vec4 color_up=texture(TEXTURE,uv_up);
	vec4 color_down=texture(TEXTURE,uv_down);
	vec4 color_left=texture(TEXTURE,uv_left);
	vec4 color_right=texture(TEXTURE,uv_right);
	
	vec4 outline=color_down+color_left+color_right+color_up;
	outline.rgb=glowingColor.rgb;
	
	vec4 origin=texture(TEXTURE,uv);
	COLOR=mix(origin,outline,origin.a==0.0?1.0:0.0);
	
}
