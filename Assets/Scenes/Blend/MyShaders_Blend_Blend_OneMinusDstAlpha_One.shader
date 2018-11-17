
Shader "MyShaders/Blend/Blend_OneMinusDstAlpha_One" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusDstAlpha One
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
