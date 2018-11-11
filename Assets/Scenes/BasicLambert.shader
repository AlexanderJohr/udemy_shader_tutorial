Shader "MyShaders/BasicLambert" {
	Properties{
		_Color ("Color", Color) = (0,0,0,0)
	}
	SubShader{

		CGPROGRAM
#pragma surface surf BasicLambert

	half4 LightingBasicLambert(SurfaceOutput s, half3 lightDir, half atten){
		half3 dotProd = dot(lightDir, s.Normal);

		half4 c;
		c.rgb = s.Albedo * _LightColor0 * (atten * dotProd);
		c.a = s.Alpha;
		return c;
	}

		struct Input {
		float3 worldRefl;
	};

	float4 _Color;

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = _Color.rgb;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
