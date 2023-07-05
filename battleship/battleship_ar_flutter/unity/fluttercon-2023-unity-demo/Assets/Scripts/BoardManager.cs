using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class BoardManager : MonoBehaviour
{
    public ARTrackedImageManager arTrackedImageManager;
    public GameObject gameboard;
    private bool isGameBoardPlaced = false;

    void Start()
    {
        arTrackedImageManager.trackedImagesChanged += OnTrackedImageChanged;
    }

    private void OnTrackedImageChanged(ARTrackedImagesChangedEventArgs args)
    {
        if (isGameBoardPlaced || args.added.Count < 0) return;
        var map = args.added[0];

        var myBoard = Instantiate(gameboard, map.transform);
        var otherBoard = Instantiate(gameboard, map.transform);

        otherBoard.GetComponent<Board>().isEnabled = true;
        myBoard.transform.position += Vector3.forward * 0.1f * 7f;

        isGameBoardPlaced = true;
    }
}
