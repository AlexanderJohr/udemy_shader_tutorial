
Shader "MyShaders/Blend/Blend_SrcColor_Zero" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend SrcColor Zero
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
