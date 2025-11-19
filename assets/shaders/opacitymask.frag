#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float reverseMask;
};

layout(binding = 1) uniform sampler2D source;
layout(binding = 2) uniform sampler2D maskSource;

void main()
{
    float maskAlpha = texture(maskSource, qt_TexCoord0.st).a;
    float finalMask = mix(maskAlpha, 1.0 - maskAlpha, reverseMask);
    fragColor = texture(source, qt_TexCoord0.st) * finalMask * qt_Opacity;
}
