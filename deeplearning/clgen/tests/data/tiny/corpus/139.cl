typedef int int2 __attribute((ext_vector_type(2)));
typedef int int3 __attribute((ext_vector_type(3)));
typedef int int4 __attribute((ext_vector_type(4)));

__constant int4 a = (int4)(1, 2, 3, 4);
__constant int4 b = (int4)((int2)(1, 2), 3, 4);
__constant int4 c = (int4)(1, (int2)(2, 3), 4);
__constant int4 d = (int4)(1, 2, (int2)(3, 4));
__constant int4 e = (int4)((int2)(1, 2), (int2)(3, 4));
__constant int4 f = (int4)((int3)(1, 2, 3), 4);
__constant int4 g = (int4)(1, (int3)(2, 3, 4));

typedef float float2 __attribute((ext_vector_type(2)));
typedef float float3 __attribute((ext_vector_type(3)));
typedef float float4 __attribute((ext_vector_type(4)));

__constant float4 h = (float4)(1, 2, 3, 4);
__constant float4 i = (float4)((float2)(1, 2), 3, 4);
__constant float4 j = (float4)(1, (float2)(2, 3), 4);
__constant float4 k = (float4)(1, 2, (float2)(3, 4));
__constant float4 l = (float4)((float2)(1, 2), (float2)(3, 4));
__constant float4 m = (float4)((float3)(1, 2, 3), 4);
__constant float4 n = (float4)(1, (float3)(2, 3, 4));