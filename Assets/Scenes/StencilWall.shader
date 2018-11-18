Shader "MyShaders/StencilWall" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}


	_StencilRef("Stencil Ref", Float) = 1
	[Enum(UnityEngine.Rendering.CompareFunction)] _CompFunc("Compare Func", Float) = 1
	[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp("Stencil Op", Float) = 1
	}
	SubShader {
		Tags { "Queue"="Geometry-1" }

		ColorMask 0
		ZWrite off

		Stencil{
			Ref[_StencilRef]
			Comp[_CompFunc]
			Pass[_StencilOp]
		}

		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		fixed4 _Color;
		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
