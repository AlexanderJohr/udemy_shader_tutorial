Shader "MyShaders/BlendTwoImages2" {
	Properties {
		_Tex1("Tex 1", 2D) = "white" {}
		_Tex2("Tex 2", 2D) = "white" {}
		_Tex3("Tex 3", 2D) = "white" {}
		_ShowTexNumber("Show Tex Number", Range(0,3)) = 0.0

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _Tex1;
		sampler2D _Tex2;
		sampler2D _Tex3;
		float _ShowTexNumber;


		struct Input {
			float2 uv_Tex1;
			float2 uv_Tex2;
			float2 uv_Tex3;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 t1 = tex2D(_Tex1, IN.uv_Tex1);
			fixed4 t2 = tex2D(_Tex2, IN.uv_Tex1);
			fixed4 t3 = tex2D(_Tex3, IN.uv_Tex1);

			if (_ShowTexNumber < 1) {
				o.Albedo = t1.rgb;
			}
			else if(_ShowTexNumber < 2) {
				o.Albedo = t2.a > 0.9 ? t2.rgb : t1.rgb;
			}
			else {
				o.Albedo = t3.a > 0.9 ? t3.rgb : t1.rgb;
			}
		}
		ENDCG
	}
	FallBack "Diffuse"
}
