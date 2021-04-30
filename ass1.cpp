#include <iostream>
  using namespace std;

  int main()
  {
      int s = 0;
      int res = 0;
      cin >> s;
      int max = s;
      for (int i = 1; i < max; i++){
          if (s % i == 0){
              res++;
              max = s/i;
          }
      }
      cout << res;
    return 0;
  }