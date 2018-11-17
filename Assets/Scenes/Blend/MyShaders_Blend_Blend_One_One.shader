
Shader "MyShaders/Blend/Blend_One_One" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend One One
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
