if isSelected
{
	draw_set_color(c_green);
}
else 
{
	draw_set_color(c_red);
}

draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, txt);
draw_set_color(c_white);