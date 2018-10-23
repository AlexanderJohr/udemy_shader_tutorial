Shader "MyShaders/StandardPbr2" {
	Properties {

		_Smoothness("Smoothness Tex", 2D) = "white" {}
		_Metallic ("Metallic", Color) = (1,1,1,1)
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
		float4 _Metallic;
		half _Spec;

	
		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Albedo= _Color.rgb;
			o.Smoothness= tex2D(_Smoothness, IN.uv_Smoothness).r;			
			o.Metallic= _Metallic.rgb;		
		}
		ENDCG
	}
	FallBack "Diffuse"
}
