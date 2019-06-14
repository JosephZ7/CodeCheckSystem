#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int temp = *b;
    *b = *a;
    *a = temp;
}

void max_heapify(int arr[], int start, int end) {
    // ���������cָ�˺��ӹ��cָ��
    int dad = start;
    int son = dad * 2 + 1;
    while (son <= end) { // ���ӹ��cָ���ڹ����Ȳ������^
        if (son + 1 <= end && arr[son] < arr[son + 1]) // �ȱ��^�ɂ��ӹ��c��С���x������
            son++;
        if (arr[dad] > arr[son]) //��������c����ӹ��c�����{���ꮅ��ֱ����������
            return;
        else { // ��t���Q���Ӄ������^�m�ӹ��c�͌O���c���^
            swap(&arr[dad], &arr[son]);
            dad = son;
            son = dad * 2 + 1;
        }
    }
}

void heap_sort(int arr[], int len) {
    int i;
    // ��ʼ����i������һ�������c�_ʼ�{��
    for (i = len / 2 - 1; i >= 0; i--)
        max_heapify(arr, i, len - 1);
    // �Ȍ���һ��Ԫ�غ����ź�Ԫ��ǰһλ�����Q���������{����ֱ�������ꮅ
    for (i = len - 1; i > 0; i--) {
        swap(&arr[0], &arr[i]);
        max_heapify(arr, 0, i - 1);
    }
}

int main() {
    int arr[] = { 3, 5, 3, 0, 8, 6, 1, 5, 8, 6, 2, 4, 9, 4, 7, 0, 1, 8, 9, 7, 3, 1, 2, 5, 9, 7, 4, 0, 2, 6 };
    int len = (int) sizeof(arr) / sizeof(*arr);
    heap_sort(arr, len);
    int i;
    for (i = 0; i < len; i++)
        printf("%d ", arr[i]);
    printf("\n");
    return 0;
}