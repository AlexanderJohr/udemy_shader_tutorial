Shader "MyShaders/StandardSpecPbr" {
	Properties {

		_Smoothness("Smoothness Tex", 2D) = "white" {}
		_Specular ("Specular", Color) = (1,1,1,1)
		_Color ("Color", Color) = (1,1,1,1)
		
	}
	SubShader {
		CGPROGRAM
		
		#pragma surface surf StandardSpecular

		struct Input {
			float3 viewDir;
			float2 uv_Smoothness;
		};

		sampler2D _Smoothness;
		float4 _Color;
		float4 _Specular;

	
		void surf (Input IN, inout SurfaceOutputStandardSpecular o) {
			o.Albedo= _Color.rgb;
			o.Smoothness= tex2D(_Smoothness, IN.uv_Smoothness).r;			
			o.Specular= _Specular;		
		}
		ENDCG
	}
	FallBack "Diffuse"
}
