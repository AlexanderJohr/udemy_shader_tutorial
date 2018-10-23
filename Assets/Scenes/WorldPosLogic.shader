Shader "MyShaders/WorldPosLogic" {
	Properties {
		
	}
	SubShader {
		CGPROGRAM
		
		#pragma surface surf Lambert 

		struct Input {
			float3 worldPos;
			float3 viewDir;
		};

	
		void surf (Input IN, inout SurfaceOutput o) {
		half rim = 1- saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission= IN.worldPos.y > 0 ? float3(rim,0,0) : float3(0,rim,0);			
		}
		ENDCG
	}
	FallBack "Diffuse"
}
