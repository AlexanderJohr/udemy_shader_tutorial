
Shader "MyShaders/Blend/Blend_SrcAlphaSaturate_Zero" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcAlphaSaturate Zero
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
