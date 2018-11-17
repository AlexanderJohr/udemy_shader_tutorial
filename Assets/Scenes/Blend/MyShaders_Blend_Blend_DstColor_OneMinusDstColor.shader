
Shader "MyShaders/Blend/Blend_DstColor_OneMinusDstColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend DstColor OneMinusDstColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
