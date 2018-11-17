
Shader "MyShaders/Blend/Blend_One_SrcAlphaSaturate" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend One SrcAlphaSaturate
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
