Shader "MyShaders/DotProd" {
	Properties{
		_Red("Red",Range(0,1)) = 0
		_Green("Green",Range(0,1)) = 0
		_Blue("Blue",Range(0,1)) = 0

		_RedDot("RedDot",Range(-1,1)) = 0
		_GreenDot("GreenDot",Range(-1,1)) = 0
		_BlueDot("BlueDot",Range(-1,1)) = 0
	}
		SubShader{

		CGPROGRAM

#pragma surface surf Lambert


		half _Red;
		half _Green;
		half _Blue;
		half _RedDot;
		half _GreenDot;
		half _BlueDot;
	struct Input {
		float3 viewDir;
	};

	void surf(Input IN, inout SurfaceOutput o) {
		half dotProd = dot(IN.viewDir, o.Normal);
		o.Albedo = float3(_RedDot - dotProd + _Red, _GreenDot  - dotProd  + _Green, _BlueDot - dotProd + _Blue);
	}
	ENDCG
	}
		FallBack "Diffuse"
}
