import java.util.Arrays;

public class HeapSort {
    private int[] arr;
    public HeapSort(int[] arr) {
        this.arr = arr;
    }

    /**
     * ���������Ҫ��ڷ�������������
     */
    public void sort() {
        /*
         *  ��һ����������ѻ�
         *  beginIndex = ��һ����Ҷ�ӽڵ㡣
         *  �ӵ�һ����Ҷ�ӽڵ㿪ʼ���ɡ���������һ��Ҷ�ӽڵ㿪ʼ��
         *  Ҷ�ӽڵ���Կ����ѷ��϶�Ҫ��Ľڵ㣬���ڵ�������Լ����Լ�����ֵΪ���
         */
        int len = arr.length - 1;
        int beginIndex = (len - 1) >> 1;
        for (int i = beginIndex; i >= 0; i--)
            maxHeapify(i, len);
        /*
         * �ڶ������Զѻ���������
         * ÿ�ζ����Ƴ����ĸ��ڵ�A[0]������β���ڵ�λ�õ�����ͬʱ�������� - 1��
         * Ȼ����������������ڵ��ĩβԪ�أ�ʹ����϶ѵ����ԡ�
         * ֱ��δ����Ķѳ���Ϊ 0��
         */
        for (int i = len; i > 0; i--) {
            swap(0, i);
            maxHeapify(0, i - 1);
        }
    }

    private void swap(int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    /**
     * ��������Ϊ index �������ݣ�ʹ����϶ѵ����ԡ�
     *
     * @param index ��Ҫ�ѻ���������ݵ�����
     * @param len δ����Ķѣ����飩�ĳ���
     */
    private void maxHeapify(int index, int len) {
        int li = (index << 1) + 1; // ���ӽڵ�����
        int ri = li + 1;           // ���ӽڵ�����
        int cMax = li;             // �ӽڵ�ֵ���������Ĭ�����ӽڵ㡣
        if (li > len) return;      // ���ӽڵ������������㷶Χ��ֱ�ӷ��ء�
        if (ri <= len && arr[ri] > arr[li]) // ���ж������ӽڵ㣬�ĸ��ϴ�
            cMax = ri;
        if (arr[cMax] > arr[index]) {
            swap(cMax, index);      // ������ڵ㱻�ӽڵ������
            maxHeapify(cMax, len);  // ����Ҫ�����жϻ��º�ĸ��ڵ��Ƿ���϶ѵ����ԡ�
        }
    }

    /**
     * ��������
     *
     * �����
     * [0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9]
     */
    public static void main(String[] args) {
        int[] arr = new int[] {3, 5, 3, 0, 8, 6, 1, 5, 8, 6, 2, 4, 9, 4, 7, 0, 1, 8, 9, 7, 3, 1, 2, 5, 9, 7, 4, 0, 2, 6};
        new HeapSort(arr).sort();
        System.out.println(Arrays.toString(arr));
    }
}