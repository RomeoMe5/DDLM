unsigned isqrt (unsigned x)
{
    unsigned m, y, b;

    m = 0x40000000;
    y = 0;

    while (m != 0)  // Do 16 times
    {
        b = y |  m;
        y >>= 1;
            
        if (x >= b)
        {
            x -= b;
            y |= m;
        }
            
        m >>= 2;
    }

    return y;
}
