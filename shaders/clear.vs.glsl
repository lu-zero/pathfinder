#version 330

// pathfinder/shaders/clear.vs.glsl
//
// Copyright © 2020 The Pathfinder Project Developers.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

precision highp float;

#ifdef GL_ES
precision highp sampler2D;
#endif

uniform vec4 uRect;
uniform vec2 uFramebufferSize;

in ivec2 aPosition;

void main() {
    vec2 position = mix(uRect.xy, uRect.zw, vec2(aPosition)) / uFramebufferSize * 2.0 - 1.0;
    gl_Position = vec4(position.x, -position.y, 0.0, 1.0);
}
