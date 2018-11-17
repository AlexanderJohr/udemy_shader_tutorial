Shader "MyShaders/ToonRampChallenge" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Ramp ("Ramp Tex", 2D) = "black" {}
	}
	SubShader {

		CGPROGRAM
		
		struct Input {
			float2 uv_Ramp;
		};
		fixed4 _Color;
		
		sampler2D _Ramp;
		
		#pragma surface surf ToonRampChallenge

		half4 LightingToonRampChallenge(SurfaceOutput o, half3 lightDir,  half3 viewDir, half atten){
			half normalViewDirDotProd = dot(o.Normal, viewDir);
			half2 normalViewDirDotProd2D = normalViewDirDotProd;
			
			half4 output;
			output.rgb = tex2D(_Ramp, normalViewDirDotProd2D).rgb;
			output.a = o.Alpha;
			return output;
		}



		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = _Color.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
