using System.Collections;
using System.Collections.Generic;
using FlutterUnityIntegration;
using Newtonsoft.Json.Linq;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class HitManager : MonoBehaviour
{
    public GameManager gameManager;

    public Camera arCamera;


    void Update()
    {
        var isCurrentPlayer = gameManager.player == 1;

        if (!isCurrentPlayer || Input.touchCount <= 0) return;
        Touch touch = Input.GetTouch(0);

        if (touch.phase != TouchPhase.Began) return;
        var clickedTile = FindClickedTile(touch.position);

        if (clickedTile != null)
        {
            OnClicked(clickedTile);
        }
    }


    private GameObject FindClickedTile(Vector2 coords)
    {
        Ray ray = arCamera.ScreenPointToRay(coords);
        RaycastHit hitObject;
        if (Physics.Raycast(ray, out hitObject))
        {
            return hitObject.transform.gameObject;
        } else
        {
            return null;
        }
    }


    private void OnClicked(GameObject tile)
    {

        var tileData = tile.GetComponent<BoardTileData>();

        var isBoardEnabled = tile.GetComponentInParent<Board>().isEnabled;
        var tileWasShot = tileData.state != TileState.unknown && tileData.state != TileState.shotFlying;

        if (isBoardEnabled && !tileWasShot)
        {
            tile.GetComponent<Renderer>().material.color = new Color32(200, 200, 200, 200);
            // TODO possible deadlock if server is not reached!
            tileData.state = TileState.shotFlying;
            var msg = new JObject();
            msg.Add("x", tileData.x);
            msg.Add("y", tileData.y);

            // TODO besseres json?
            GetComponent<UnityMessageManager>().SendMessageToFlutter(msg.ToString());
        }


    }
}
