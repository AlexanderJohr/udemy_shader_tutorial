
Shader "MyShaders/Blend/Blend_SrcAlpha_DstAlpha" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlpha DstAlpha
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
