#include <stdio.h>

#define ARR_LEN 255 /* ���鳤������ */
#define elemType int /* Ԫ������ */

/* ð������ */
/* 1. �ӵ�ǰԪ����������αȽ�ÿһ������Ԫ�أ��������򽻻� */
/* 2. ������Ԫ�ؾ��ظ����ϲ��裬ֱ�����һ��Ԫ�� */
/* elemType arr[]: ����Ŀ������; int len: Ԫ�ظ��� */
void bubbleSort (elemType arr[], int len) {
	elemType temp;
	int i, j;
	for (i=0; i<len-1; i++) /* ��ѭ��Ϊ����������len��������len-1�� */
		for (j=0; j<len-1-i; j++) { /* ��ѭ��Ϊÿ�˱ȽϵĴ�������i�˱Ƚ�len-i�� */
			if (arr[j] > arr[j+1]) { /* ����Ԫ�رȽϣ��������򽻻�������Ϊ������ң�����֮�� */
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
}

int main (void) {
	elemType arr[ARR_LEN] = {3,5,1,-7,4,9,-6,8,10,4};
	int len = 10;
	int i;
	
	bubbleSort (arr, len);
	
	for (i=0; i<len; i++)
		printf ("%d\t", arr[i]);
	putchar ('\n');
	
	return 0;
}