Shader "MyShaders/AllProps" {
	Properties{
			_myColor("Color", Color) = (0,0,0,0)
			_myRange("Range", Range(0,5)) = 0.0
			_myRange2("Range2", Range(0,5)) = 0.0
			_myTex("Tex", 2D) = "" {}
			_myTex2("Tex", 2D) = "" {}
			_myCube("Cube", CUBE) = "" {}
			_myFloat("Float", Float) = 0.5
			_myVector("Vector", Vector) = (0.5, 1, 1, 1)
	}
		SubShader{
			CGPROGRAM
			#pragma surface surf Lambert

		fixed4 _myColor;
		half _myRange;
		half _myRange2;
		sampler2D _myTex;
		sampler2D _myTex2;

		samplerCUBE _myCube;
		float _myFloat;
		float4 _myVector;

		struct Input {
			float2 uv_myTex;
			float3 worldRefl;

		};

		void surf(Input IN, inout SurfaceOutput o) {
			float4 green = float4(0, 1, 0, 0);
				o.Albedo =  (tex2D(_myTex, IN.uv_myTex) * _myRange * green.rgb).rgb;

			o.Emission = (texCUBE(_myCube, IN.worldRefl) * _myRange2).rgb;
		}
		ENDCG
			}
				FallBack "Diffuse"
}
