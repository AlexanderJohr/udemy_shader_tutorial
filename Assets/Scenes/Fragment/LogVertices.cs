using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LogVertices : MonoBehaviour
{

    // Use this for initialization
    void Start()
    {
        MeshFilter meshRenderer = this.GetComponent<MeshFilter>();
        foreach (var vert in meshRenderer.mesh.vertices)
        {
            print(vert);
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
}
