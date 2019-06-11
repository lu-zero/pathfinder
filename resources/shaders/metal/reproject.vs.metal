#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct spvDescriptorSetBuffer0
{
    constant float4x4* uNewTransform [[id(0)]];
};

struct main0_out
{
    float2 vTexCoord [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct main0_in
{
    float2 aPosition [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexID [[vertex_id]], uint gl_InstanceID [[instance_id]])
{
    main0_out out = {};
    out.vTexCoord = in.aPosition;
    out.gl_Position = (*spvDescriptorSet0.uNewTransform) * float4(in.aPosition, 0.0, 1.0);
    return out;
}

