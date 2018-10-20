Shader "MyShaders/NormalMapBright" {
	Properties{

		_Tex("Tex", 2D) = "white" {}
	_NormalMap("Normal Map", 2D) = "white" {}
	_NormalRange("Normal Range", Range(0,10)) = 0.0
		_Brightness("Brightness Range", Range(0,10)) = 1.0

	}
		SubShader{

		CGPROGRAM

#pragma surface surf Lambert

		sampler2D _Tex;
	sampler2D _NormalMap;
	half _NormalRange;
	half _Brightness;

	struct Input {
		float2 uv_Tex;
		float2 uv_NormalMap;

	};

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = tex2D(_Tex, IN.uv_Tex) ;
		o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap) ) * _Brightness;
		o.Normal *= float3(_NormalRange, _NormalRange, 1);

	}
	ENDCG
	}
		FallBack "Diffuse"
}
