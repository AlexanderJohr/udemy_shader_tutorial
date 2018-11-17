
Shader "MyShaders/Blend/Blend_OneMinusSrcColor_Zero" {

    Properties {
                _MainTex("Tex", 2D) = "black" { }
            }
            SubShader {
                Tags { "Queue" = "Transparent" }
                Pass{
                    Blend OneMinusSrcColor Zero
                    SetTexture[_MainTex]{ combine texture }
                }
            }
            FallBack "Diffuse"
}
