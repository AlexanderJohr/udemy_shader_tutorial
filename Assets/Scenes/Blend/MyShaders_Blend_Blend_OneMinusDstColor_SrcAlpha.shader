
Shader "MyShaders/Blend/Blend_OneMinusDstColor_SrcAlpha" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusDstColor SrcAlpha
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
