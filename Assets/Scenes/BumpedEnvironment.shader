﻿Shader "MyShaders/BumpedEnvironment" {
	Properties{

		_Tex("Tex", 2D) = "white" {}
	_NormalMap("Normal Map", 2D) = "white" {}
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
		o.Albedo = (texCUBE(_Cube, IN.worldRefl)* _myRange2).rgb;
	}
	ENDCG
	}
		FallBack "Diffuse"
}
