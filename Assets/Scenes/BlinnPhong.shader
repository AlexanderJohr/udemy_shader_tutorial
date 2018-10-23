Shader "MyShaders/BlinnPhong" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_SpecColor ("Spec Color", Color) = (1,1,1,1)
		_Gloss ("Gloss", Range(0,1)) = 0
		_Spec ("Spec", Range(0,1)) = 0
	}
	SubShader {
		CGPROGRAM
		
		#pragma surface surf BlinnPhong 

		struct Input {
			float3 viewDir;
		};

		float4 _Color;
		half _Gloss;
		half _Spec;

	
		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo= _Color.rgb;
			o.Gloss= _Gloss;			
			o.Specular= _Spec;		
		}
		ENDCG
	}
	FallBack "Diffuse"
}
