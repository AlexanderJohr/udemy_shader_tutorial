Shader "MyShaders/BlendTwoImages" {
	Properties {
		_Tex1("Tex 1", 2D) = "white" {}
		_Tex2("Tex 2", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _Tex1;
		sampler2D _Tex2;


		struct Input {
			float2 uv_Tex1;
			float2 uv_Tex2;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 t1 = tex2D(_Tex1, IN.uv_Tex1);
			fixed4 t2 = tex2D(_Tex2, IN.uv_Tex2);

			o.Albedo = t1.rgb * t2.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
