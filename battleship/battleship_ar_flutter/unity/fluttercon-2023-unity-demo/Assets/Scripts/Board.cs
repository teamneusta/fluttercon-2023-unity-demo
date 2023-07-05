using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Board : MonoBehaviour
{
    public int height;
    public int width;
    public GameObject tilePrefab;
    public bool isEnabled = false;

    private readonly List<GameObject> tiles = new();



    void Start()
    {
        for (int y = 0; y < height; y++)
        {
            for (int x = 0; x < width; x++)
            {
                tiles.Add(CreateTile(x, y));
            }
        }
    }

    public void OnShotFired(Shot shot)
    {
        var tileGameObject = tiles[shot.y * height + shot.x];
        var tileData = tileGameObject.GetComponent<BoardTileData>();
        if (tileData.state == TileState.ownShip) return;
        tileData.state = TileState.hit;
    }

    private Vector3 size
    {
        get { return tilePrefab.GetComponent<Renderer>().bounds.size; }
    }

    private Vector3 startPosition
    {
        get
        {
            return transform.position + (width / 2 * Vector3.left * size.x) +
                (height / 2 * Vector3.forward * size.z) +
                (Vector3.left * 0.01f * width) +
                (Vector3.forward * 0.01f * height);

        }
    }

    private GameObject CreateTile(int x, int y)
    {
        var tile = Instantiate(tilePrefab, startPosition - (x * (Vector3.left * 0.01f + Vector3.left * size.x)) - (y * (Vector3.forward * 0.01f + Vector3.forward * size.z)), Quaternion.identity, transform);
        tile.GetComponent<BoardTileData>().x = x;
        tile.GetComponent<BoardTileData>().y = y;
        return tile;
    }


    public void UpdateFromGrid(Grid grid)
    {
        Debug.Log("UpdateFromGrid!");
        Debug.Log(tiles.Count);
        foreach(var part1 in tiles)
        {
            var partComponent = part1.GetComponent<BoardTileData>();
            var x = partComponent.x;
            var y = partComponent.y;
            var status = int.Parse(grid.GetValueForPosition(x, y));
            if (status == 0)
            {
                part1.transform.GetComponent<Renderer>().material.color = Color.white;
            } else if (status == 1)
            {
                part1.transform.GetComponent<Renderer>().material.color = Color.red;
            } else if (status == 2)
            {
                part1.transform.GetComponent<Renderer>().material.color = Color.green;
            } else
            {
                part1.transform.GetComponent<Renderer>().material.color = Color.blue;
            }
        }
    }
}
