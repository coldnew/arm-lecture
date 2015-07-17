#include <stdio.h>

extern int fibonacci(int x);

# if 0
int fibonacci(int n)
{
  if(n <= 1){
    return n;
  }
  int fibo = 1;      // R3
  int fiboPrev = 1;  // R4
  int tmp = 0;       // R5
  for(int i = 2; i < n; i++){ // R6
    tmp = fibo;
    fibo += fiboPrev;
    fiboPrev = tmp;
  }
  return fibo;
}
#endif

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  scanf("%d",&number);
  result = fibonacci(number);
  printf("The fibonacci sequence at %d is: %d\n", number, result);
}
