#version 140

in vec2 position;

out vec2 texCoords1;
out vec2 texCoords2;
out float blend;

uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;

uniform vec2 texOffset1;
uniform vec2 texOffset2;
uniform vec2 texCoordInfo;

void main(void){

	vec2 texCoords = position + vec2(0.5, 0.5);
	texCoords.y = 1.0 - texCoords.y;
	texCoords /= texCoordInfo.x;

	texCoords1 = texCoords + texOffset1;
	texCoords2 = texCoords + texOffset2;
	blend = texCoordInfo.y;

	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 0.0, 1.0);
}
