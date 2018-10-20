Shader "MyShaders/FirstShader" {
	Properties{
		_myColor("MyColor", Color) = (1,1,1,1)
		_myEmission("MyEmission", Color) = (1,1,1,1)
		_NormalMap("MyEmission", 2D) = "white" {}

	}
		SubShader{
			CGPROGRAM
				#pragma surface surf Lambert

				struct Input {
					float2 uv_NormalMap;

				};
				fixed4 _myColor;
				fixed4 _myEmission;
				fixed4 _myNormal;
				sampler2D _NormalMap;

				void surf(Input IN, inout SurfaceOutput o) {
					o.Albedo = _myColor.rgb;
					o.Emission = _myEmission.rgb;
					o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
				}
			ENDCG
	}
		FallBack "Diffuse"
}
