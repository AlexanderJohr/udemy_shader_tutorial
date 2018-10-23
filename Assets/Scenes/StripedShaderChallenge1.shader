Shader "MyShaders/StripedShaderChallenge1" {
	Properties {
		_Tex ("Texture", 2D) = "white" {}
		_StripeSize ("Stripe Size", Range(0,100)) = 0.0
	}
	SubShader {
		CGPROGRAM
		
		#pragma surface surf Lambert 

		struct Input {
			float3 worldPos;
			float3 viewDir;
			float2 uv_Tex;
		};

		sampler2D _Tex;
		half _StripeSize;
	
		void surf (Input IN, inout SurfaceOutput o) {
			half rim = 1- saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission= frac(IN.worldPos.y * _StripeSize * 0.5) > 0.4 ? float3(rim,0,0) : float3(0,rim,0);			
			o.Albedo= tex2D(_Tex, IN.uv_Tex).rgb;			
		}
		ENDCG
	}
	FallBack "Diffuse"
}
