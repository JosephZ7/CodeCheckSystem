  public static void bubbleSort(int[] arr) {
    int i, temp, len = arr.length;
    boolean changed;
    do {
      changed = false;
      len-=1;
      for (i = 0; i < len; i++) {
        if (arr[i] > arr[i + 1]) {
          temp = arr[i];
          arr[i] = arr[i + 1];
          arr[i + 1] = temp;
          changed = true;
        }
      }
    } while (changed);
  }
  
  public static <T extends Comparable<T>> void bubbleSort2(T[] arr) {
        int n = arr.length;
        int newn;
        do {
            newn = 0;
            for (int i = 1; i < n; i++)
                if (arr[i - 1].compareTo(arr[i]) > 0) {
                    swap(arr, i - 1, i);
                    newn = i;
                }
            n = newn;
        } while (newn > 0);
  }