using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;

[RequireComponent(typeof(ARRaycastManager))] //para asegurar que todos tienen el raycast manager
public class aparicionTouch : MonoBehaviour
{
    public GameObject mapa3dUniversidad;

    private ARRaycastManager _arRaycastManager;
    private GameObject _mapaClickeado;
    private Vector2 posicionClick;

    static List<ARRaycastHit> hits = new List <ARRaycastHit>(); //lista para guardar 

    
    private void Awake()//se llama al iniciar el codigo
    {
        _arRaycastManager = GetComponent<ARRaycastManager>();

    }

    bool hayClick(out Vector2 posicionClick)//verificador de si se está clickeando la pantalla
    {
        if (Input.touchCount > 0)
        {
            posicionClick = Input.GetTouch(0).position;
            return true;
        }
        else
        {
            posicionClick=default;
            return false;
        }
    }
    // Update is called once per frame
    void Update()
    {
        if(hayClick(out Vector2 posicionClick)==false){
            return;//si no hay click en la pantalla no hay cambio y no se retorna nada en el Update()
        }
        if(_arRaycastManager.Raycast(posicionClick,hits,TrackableType.PlaneWithinPolygon)){

            var posicionRaycast = hits[0].pose;

            if (_mapaClickeado == null){
                _mapaClickeado = Instantiate(mapa3dUniversidad,posicionRaycast.position,posicionRaycast.rotation);//si todavia no existe el mapa, se creará
            }
            else{
                _mapaClickeado.transform.position = posicionRaycast.position;//si ya existe el mapa, se podrá mover
            }
        }
    }
}
