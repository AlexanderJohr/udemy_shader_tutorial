Shader "MyShaders/StencilRim2" {
	Properties {
		_RimColor ("Rim Color", Color) = (0,0,0,0)
		_RimPower ("Rim Power", Range(0,10)) = 0.0

		_StencilRef("Stencil Ref", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)] _CompFunc("Compare Func", Float) = 1
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp("Stencil Op", Float) = 1

	}
	SubShader {
		Tags{
		"Queue" = "Geometry"
	}
		Stencil{
			Ref[_StencilRef]
			Comp[_CompFunc]
			Pass[_StencilOp]
		}
		CGPROGRAM
		
		#pragma surface surf Lambert 



		struct Input {
			float2 uv_MainTex;
			float3 viewDir;
		};

		half _RimPower;
		float4 _RimColor;

		void surf (Input IN, inout SurfaceOutput o) {
			half rim = 1- saturate(dot(normalize(IN.viewDir), o.Normal));
			
			o.Emission= rim > 0.4 ? _RimColor.rgb * pow(rim,_RimPower) : _RimColor.rgb * pow(rim,0.1);// float3(pow(fotProd,0.2),1,1);
			
		}
		ENDCG
	}
	FallBack "Diffuse"
}
