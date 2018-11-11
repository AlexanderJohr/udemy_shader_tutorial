Shader "MyShaders/ToonRampChallengeA" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Ramp ("Ramp Tex", 2D) = "white" {}
	}
	SubShader {

		CGPROGRAM
		
		struct Input {
			float2 uv_Ramp;
			float3 viewDir;
		};
		fixed4 _Color;
		
		sampler2D _Ramp;
		
		#pragma surface surf ToonRampChallenge

		float4 LightingToonRampChallenge(SurfaceOutput o, fixed3 lightDir, fixed atten){
			float lightDirNormalDotProd = dot(lightDir, o.Normal);
			float2 lightDirNormalDotProd2D = lightDirNormalDotProd * 0.5 + 0.5;
			float3 ramp = tex2D(_Ramp, lightDirNormalDotProd2D).rgb;
			

			float4 output;
			output.rgb = o.Albedo * _LightColor0.rgb * (ramp);
			output.a = o.Alpha;
			return output;
		}



		void surf (Input IN, inout SurfaceOutput o) {
			

			half normalViewDirDotProd = dot(o.Normal, IN.viewDir);
			half2 normalViewDirDotProd2D = normalViewDirDotProd * 0.5 + 0.5;
			o.Albedo = tex2D(_Ramp, normalViewDirDotProd).rgb;

		}
		ENDCG
	}
	FallBack "Diffuse"
}
