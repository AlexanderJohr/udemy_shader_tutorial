Shader "MyShaders/BasicBlinn" {
	Properties{
		_Color ("Color", Color) = (0,0,0,0)
	}
	SubShader{

		CGPROGRAM
#pragma surface surf BasicBlinn

	half4 LightingBasicBlinn(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten){
		
		half3 halfway = normalize( viewDir + lightDir );
		half halfwayDotProductWithNormal = max(0, dot(halfway, s.Normal));
		half spec = pow (halfwayDotProductWithNormal,48.0);

		half3 diff = max(0, dot(lightDir, s.Normal));
		
		half4 c;
		c.rgb = (s.Albedo * _LightColor0 * diff + _LightColor0 * spec) * atten;
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
