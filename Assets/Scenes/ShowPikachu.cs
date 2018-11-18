using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShowPikachu : MonoBehaviour {
    Material mat;
    // Use this for initialization
    void Start () {
        mat = this.GetComponent<Renderer>().sharedMaterial;
	}
	
	// Update is called once per frame
	void Update () {
        var seconds = Time.time;
        
        var threeSecondsModulo = seconds % 3;
        if (threeSecondsModulo < 1) {
            mat.SetFloat("_ShowTexNumber", 1);
        }
        else if(threeSecondsModulo < 2)
        {
            mat.SetFloat("_ShowTexNumber", 2);

        }
        else
        {
            mat.SetFloat("_ShowTexNumber", 0);

        }
    }
}
