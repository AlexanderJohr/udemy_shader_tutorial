
Shader "MyShaders/Blend/Blend_OneMinusSrcAlpha_SrcAlphaSaturate" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcAlpha SrcAlphaSaturate
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
