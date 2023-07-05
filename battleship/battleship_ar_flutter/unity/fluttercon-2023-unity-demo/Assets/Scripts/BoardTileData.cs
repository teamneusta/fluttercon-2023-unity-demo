using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoardTileData : MonoBehaviour
{

    public int x;
    public int y;
    private TileState _state;

    public TileState state
    {
        get
        {
            return _state;
        }

        set
        {
            _state = state;
            Debug.Log("SHOT WAS FIRED: " + state);

        }
    }

}

public enum TileState
{
    ownShip,
    unknown,
    shotFlying,
    hit,
    miss,
}
