using Newtonsoft.Json.Linq;

public class Shot
{
    private int _x;
    private int _y;
    private bool _isHit;
    private bool isMyBoard;

    public int x
    {
        get
        {
            return _x;
        }
    }

    public int y
    {
        get
        {
            return _y;
        }
    }

    public bool isHit
    {
        get
        {
            return _isHit;
        }
    }

    public Shot(int x, int y, bool isHit)
    {
        this._x = x;
        this._y = y;
        this._isHit = isHit;

    }

    public static Shot Parse(string jsonString)
    {
        var shot = JObject.Parse(jsonString);
        var x = (int)shot.GetValue("x");
        var y = (int)shot.GetValue("y");
        var isHit = (bool)shot.GetValue("istHit");
        var isOnMyBoard = true; // TODO <- aus json
        return new Shot(x, y, isHit);

    }
}
