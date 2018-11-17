
Shader "MyShaders/Blend/Blend_DstAlpha_SrcAlpha" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend DstAlpha SrcAlpha
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
