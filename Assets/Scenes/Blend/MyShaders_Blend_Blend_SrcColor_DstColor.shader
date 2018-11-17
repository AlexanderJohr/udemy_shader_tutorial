
Shader "MyShaders/Blend/Blend_SrcColor_DstColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcColor DstColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
