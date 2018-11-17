
Shader "MyShaders/Blend/Blend_DstAlpha_Zero" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend DstAlpha Zero
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
