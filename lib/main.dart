#include <stdio.h>

int * sorting(*arr){
    printf("%d",arr[0]);
    return arr;
}


int main() {
    int test_case;
    int length, *ptr;
    int arr[20];
    printf("Enter number of Input\n");
    scanf("%d",&test_case);
    for(int i=0;i<test_case;i++){
        printf("Enter length of array");
        scanf("%d", &length);
        for(int j=0;j<length;j++){
            scanf("%d",&arr[j]);
        }
        ptr = sorting(arr);
    }
	//code
	return 0;
}