
Shader "MyShaders/Blend/Blend_OneMinusSrcColor_One" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcColor One
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
