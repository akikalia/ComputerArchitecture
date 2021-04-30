#include <iostream>
  using namespace std;

  int main()
  {
      int t = 0;
      int b = 0;
      cin >> t;
      cin >> b;
      bool reduced = true;
      while(reduced){
         reduced = false;
         int max = t;
         for (int i = 2; i <= max; i++){
              if (t % i == 0){
                  if (b % i == 0){
                    t = t/i;
                    b = b/i;
                    reduced = true;
                    break;
                  }
              }
          }     
      }
     cout<<t<<" "<<b;
    return 0;
  }
  