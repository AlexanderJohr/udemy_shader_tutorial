Shader "MyShaders/TwoTex" {
	Properties {
		_Tex1("Tex1", 2D) = "white" {}
		_Tex2("Tex2", 2D) = "white" {}
		_TexNormal("TexNormal", 2D) = "white" {}
		_RangeNormal("RangeNormal", Range(0,5)) = 0.0

	}
	SubShader {
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _Tex1;
		sampler2D _Tex2;
		sampler2D _TexNormal;
		half _RangeNormal;


		struct Input {
			float2 uv_Tex1;
			float2 uv_Tex2;
			float2 uv_TexNormal;

		};

		void surf (Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_Tex1, IN.uv_Tex1).rgb;
				o.Emission = tex2D(_Tex2, IN.uv_Tex2).rgb;
				o.Normal = UnpackNormal(tex2D(_TexNormal, IN.uv_TexNormal));
				o.Normal *= float3(_RangeNormal, _RangeNormal, 1);

		}
		ENDCG
	}
	FallBack "Diffuse"
}
