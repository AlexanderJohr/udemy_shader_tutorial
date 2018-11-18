Shader "MyShaders/StencilWhole" {
	Properties{

		_MainTex1("Main Tex", 2D) = "white" {}
	}
		SubShader{
			Tags{
				"Queue" = "Geometry-1"
			}
			ColorMask 0
				ZWrite off


		Stencil{
			Ref 1
			Comp always
			Pass replace
		}

		CGPROGRAM
#pragma surface surf Lambert

		sampler2D _MainTex1;
			struct Input {
			float2 uv_MainTex1;
		};

	void surf(Input IN, inout SurfaceOutput o) {
		o.Albedo = (0,0,0);
	}
	ENDCG
	}
		FallBack "Diffuse"
}
