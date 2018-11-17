
Shader "MyShaders/Blend/Blend_Zero_OneMinusSrcAlpha" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend Zero OneMinusSrcAlpha
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
