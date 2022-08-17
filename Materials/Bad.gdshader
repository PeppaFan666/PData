shader_type canvas_item;

uniform vec4 c : hint_color;
void fragment()
{
	COLOR = c;
}