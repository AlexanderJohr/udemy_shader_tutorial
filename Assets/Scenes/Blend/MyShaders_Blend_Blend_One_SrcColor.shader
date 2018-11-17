
Shader "MyShaders/Blend/Blend_One_SrcColor" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend One SrcColor
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
