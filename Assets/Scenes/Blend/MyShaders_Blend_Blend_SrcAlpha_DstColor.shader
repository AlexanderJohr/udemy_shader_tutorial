
Shader "MyShaders/Blend/Blend_SrcAlpha_DstColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlpha DstColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
