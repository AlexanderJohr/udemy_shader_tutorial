
Shader "MyShaders/Blend/Blend_SrcAlphaSaturate_One" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlphaSaturate One
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
