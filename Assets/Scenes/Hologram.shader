Shader "MyShaders/Hologram" {
	Properties {
		_RimColor ("Rim Color", Color) = (1,1,1,1)
		_RimPower("Rim Power", Range(0,1)) = 0.5
	}
	SubShader {
		Tags{
			"Queue" = "Transparent"
		}

		Pass{
			ZWrite on
			ColorMask 0
		}

		CGPROGRAM
		#pragma surface surf Lambert alpha:fade

		struct Input {
			float3 viewDir;
		};

		half _RimPower;
		fixed4 _RimColor;

		void surf (Input IN, inout SurfaceOutput o) {

			float rim = 1 - dot(o.Normal, IN.viewDir);

			o.Albedo = _RimColor.rgb * pow(rim, _RimPower);
			o.Alpha = pow(rim, _RimPower);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
