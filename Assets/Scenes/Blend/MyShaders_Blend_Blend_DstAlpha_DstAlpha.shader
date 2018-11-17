
Shader "MyShaders/Blend/Blend_DstAlpha_DstAlpha" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "RenderType" = "Opaque" }
                Pass{
                    Blend DstAlpha DstAlpha
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
