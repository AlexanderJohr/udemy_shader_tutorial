
Shader "MyShaders/Blend/Blend_OneMinusSrcAlpha_OneMinusSrcColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcAlpha OneMinusSrcColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
