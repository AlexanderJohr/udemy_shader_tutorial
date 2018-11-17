Shader "MyShaders/BumpedEnvironment3" {
	Properties{

		_Tex("Tex", 2D) = "black" {}
	_NormalMap("Normal Map", 2D) = "black" {}
	_NormalRange("Normal Range", Range(0,10)) = 0.0
		_Brightness("Brightness Range", Range(0,10)) = 1.0
		_Cube("Cube", CUBE) = "" {}
	_myRange2("Range2", Range(0,5)) = 0.0

	}
		SubShader{

		CGPROGRAM

#pragma surface surf Lambert

		sampler2D _Tex;
	sampler2D _NormalMap;
	samplerCUBE _Cube;
	half _NormalRange;
	half _Brightness;
	half _myRange2;

	struct Input {
		float2 uv_Tex;
		float2 uv_NormalMap;
		float3 worldRefl; INTERNAL_DATA

	};

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = (texCUBE(_Cube, WorldReflectionVector(IN, o.Normal)) * _myRange2).rgb;
		o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap)) * _Brightness;
		o.Normal *= float3(_NormalRange, _NormalRange, 1);
	}
	ENDCG
	}
		FallBack "Diffuse"
}
