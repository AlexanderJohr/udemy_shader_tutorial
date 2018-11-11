Shader "MyShaders/SecondSparkle" {
	Properties{
		_Color ("Color", Color) = (0,0,0,0)
		_RampTex ("Ramp Tex", 2D) = "white" {}
	}
	SubShader{

		CGPROGRAM
#pragma surface surf Lambert

	float4 _Color;
	sampler2D _RampTex;

	struct Input {
		float3 worldRefl;
		float2 uv_RampTex;
	};

	void surf(Input IN, inout SurfaceOutput o) {

		float2 ramp2D = IN.worldRefl.xy ;
		
		float3 ramp = tex2D(_RampTex, ramp2D ).rgb;


		o.Emission = ramp;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
