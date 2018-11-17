
Shader "MyShaders/Blend/Blend_OneMinusSrcColor_SrcAlphaSaturate" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcColor SrcAlphaSaturate
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
