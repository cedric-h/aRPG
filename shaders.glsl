/* quad vertex shader */
@vs vs
in vec4 position;
in vec4 color0;
out vec4 color;
out vec2 uv;

void main() {
    gl_Position = position;
    color = color0;
    uv = gl_Position.xy + 0.5;
}
@end

/* quad fragment shader */
@fs fs
uniform sampler2D tex;
in vec4 color;
in vec2 uv;
out vec4 frag_color;

void main() {
    frag_color = texture(tex, uv) * color;
}
@end

/* quad shader program */
@program quad vs fs
