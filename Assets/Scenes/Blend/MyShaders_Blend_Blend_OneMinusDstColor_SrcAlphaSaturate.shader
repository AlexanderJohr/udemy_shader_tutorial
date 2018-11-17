
Shader "MyShaders/Blend/Blend_OneMinusDstColor_SrcAlphaSaturate" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusDstColor SrcAlphaSaturate
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
