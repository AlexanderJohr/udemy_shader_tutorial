
Shader "MyShaders/Blend/Blend_OneMinusSrcAlpha_One" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcAlpha One
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
