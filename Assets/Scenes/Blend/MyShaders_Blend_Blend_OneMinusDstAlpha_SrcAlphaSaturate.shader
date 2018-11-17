
Shader "MyShaders/Blend/Blend_OneMinusDstAlpha_SrcAlphaSaturate" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusDstAlpha SrcAlphaSaturate
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
