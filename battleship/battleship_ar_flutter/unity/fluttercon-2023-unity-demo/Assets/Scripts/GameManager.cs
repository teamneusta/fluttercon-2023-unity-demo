using System.Collections;
using System.Collections.Generic;
using FlutterUnityIntegration;
using Newtonsoft.Json.Linq;
using UnityEngine;

public class GameManager : MonoBehaviour
{

    public delegate void OnGameUpdate(Grid grid, Grid enemyGrid);           
    public event OnGameUpdate OnUpdate;
    public int player = 0;

    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
         
    }

    void NotifyGameUpdate(string update)
    {
        var split = update.Split("&");

        var ownGrid = Grid.fromString(split[0]);
        var enemyGrid = Grid.fromString(split[1]);
        OnUpdate(ownGrid, enemyGrid);
    }

    // 0 == current, 1 == enemy.
    void NotifyPlayerUpdate(string update)
    {
        var newPlayer = int.Parse(update);

        player = newPlayer;
    }

    void OnShotFired(string json)
    {
        var shot = Shot.Parse(json);
        // todo find other board and use correct board
        var otherBoard = GetComponents<Board>()[1];

        otherBoard.OnShotFired(shot);
    }

}

public class Grid
{
    Grid(string[,] grid)
    {
        this.gridList = grid;
    }

    private string[,] gridList;

    public string GetValueForPosition(int x, int y)
    {
        return gridList[x, y];
    }

    override public string ToString()
    {
        string value = "";
        for(int i = 0; i < gridList.GetLength(0); i++)
        {
            for (int j = 0; j < gridList.GetLength(1); j++)
            {
                value += " " + gridList[i, j];
            }
            value += ";\n";

        }
        return value;
    }

    public static Grid fromString(string gridString)
    {
        var rows = gridString.Split(";");
        var grid = new string[rows.Length, rows[0].Split(",").Length];
        
        for (int i = 0; i < rows.Length; i++)
        {
            var rowList = rows[i].Split(",");
            for (int j = 0; j < rowList.Length; j++)
            {
                grid[j, i] = rowList[j];
            }

        }
        return new Grid(grid);
    }
}
