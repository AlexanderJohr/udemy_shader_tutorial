Shader "MyShaders/AlbedoEqWorldRefl" {
	Properties{

	}
	SubShader{

		CGPROGRAM
#pragma surface surf Lambert

		struct Input {
		float3 worldRefl;
	};

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = o.Normal;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
