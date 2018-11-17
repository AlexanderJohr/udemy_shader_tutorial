
Shader "MyShaders/Blend/Blend_SrcAlpha_Zero" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlpha Zero
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
