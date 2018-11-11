Shader "MyShaders/FirstSparkle" {
	Properties{
		_Color ("Color", Color) = (0,0,0,0)
		_RampTex ("Ramp Tex", 2D) = "white" {}
	}
	SubShader{

		CGPROGRAM
#pragma surface surf FirstSparkle

	float4 _Color;
	sampler2D _RampTex;

	float4 LightingFirstSparkle(SurfaceOutput s, half3 lightDir, half atten){
		float3 dotProd = dot(lightDir, s.Normal);
		float ramp1D = dotProd;
		float2 ramp2D = ramp1D ;
		
		float ramp = tex2D(_RampTex, ramp2D ).rgb;


		float4 c;
		c.rgb = s.Albedo * _LightColor0.rgb * ramp;
		c.a = s.Alpha;
		return c;
	}

	struct Input {
		float3 worldRefl;
		float2 uv_RampTex;
	};



	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = _Color.rgb;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
