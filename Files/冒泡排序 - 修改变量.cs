static void BubbleSort(int[] arr) 
{
    int temp = 0;
    bool swapped;
    for (int i = 0; i < arr.Length; i++)
    {
        swapped = false;
        for (int j = 0; j < arr.Length - 1 - i; j++)
		{
			if (arr[j] > arr[j + 1])
            {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                if (!swapped)
                    swapped = true;
            }
		}
        if (!swapped)
		{
			return;
		}
    }
}