Shader "MyShaders/StandardPbr" {
	Properties {

		_Smoothness("Smoothness Tex", 2D) = "black" {}
		_Metallic ("Metallic", Range(0,1)) = 0
		_Color ("Color", Color) = (1,1,1,1)
		
	}
	SubShader {
		CGPROGRAM
		
		#pragma surface surf Standard 

		struct Input {
			float3 viewDir;
			float2 uv_Smoothness;
		};

		sampler2D _Smoothness;
		float4 _Color;
		half _Metallic;
		half _Spec;

	
		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo= _Color.rgb;
			o.Smoothness= tex2D(_Smoothness, IN.uv_Smoothness).r;			
			o.Metallic= _Metallic;		
		}
		ENDCG
	}
	FallBack "Diffuse"
}
