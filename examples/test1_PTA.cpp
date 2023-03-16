// void g(int *a, int *b)
// {
//     if(*a == *b) a = b;
    
// }

// int main()
// {
//     int *a = new int;
//     int *b = new int;

//     g(a,a);

//     return 0;
// }

int main(void)
{
        struct {
                int *f1;
        }x, *z;

        int y[70], w;

        /* [] */
        z = &x;
        /* [(z,x,D)] */
        (*z).f1 = &w;
        /* [(<x.f1>,w,D), (z,x,D)] */
        x.f1 = &y[0];
        /* [(<x.f1>,y,P), (z,x,D)] */
}

