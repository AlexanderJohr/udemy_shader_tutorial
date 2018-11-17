
Shader "MyShaders/Blend/Blend_SrcAlphaSaturate_OneMinusSrcColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlphaSaturate OneMinusSrcColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
